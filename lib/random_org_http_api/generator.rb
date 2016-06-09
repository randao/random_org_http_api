require 'open-uri'

module RandomOrgHttpApi
  class Generator
    include RandomOrgHttpApi::Configuration
    include RandomOrgHttpApi::Error
    
    def generate_integers(params)
      generate(:integer, params)
    end

    def generate_strings(params)
      generate(:string, params)
    end

    def generate_sequence(params)
      generate(:sequence, params)
    end

    def quota
      params = { path: '/quota', params: { ip: ip, format: 'plain' } }
      api_request(params).first.to_i
    end

    def ip
      request(uri: 'http://whatismyip.akamai.com').strip
    end

    private

    def generate(type, params = {})
      params = query(type, params)
      api_request(params)
    end

    def api_request(hash)
      request(uri: URI(BASE_URI), path: hash[:path], query: hash[:params]).split
    end


    def request(params)
      uri = URI params[:uri]
      uri.path = params[:path] if params[:path]
      uri.query = URI.encode_www_form(params[:query]) if params[:query]

      exception_cb = Proc.new do |exception|
        puts exception
      end

      Retryable.retryable(tries: 3, on: OpenURI::HTTPError, exception_cb: exception_cb) do |retries, exception|
        if retries > 1
          raise QuotaError if quota == 0
        end
        open(uri).read
      end
    end


    def query(generator_type, params)
      all_params = DEFAULT_QUERY_PARAMS.merge(params)
      template = QUERY_TEMPLATE[generator_type]

      {
        path: template[:path],
        params: permit_params(all_params, template[:query_keys])
      }
    end

    def permit_params(params, required_keys)
      params.select { |k| required_keys.include?(k) }
    end
  end
end
