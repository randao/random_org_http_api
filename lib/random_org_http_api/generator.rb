require 'open-uri'
require 'net/http'

module RandomOrgHttpApi
  class Generator
    include RandomOrgHttpApi::Configuration

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
      params = {path: '/quota', params: {ip: ip, format: 'plain'}}
      request(params).first.to_i
    end

    private

    def generate(type, params={})
      params = query(type, params)
      request(params)
    end

    def request(hash)
      uri = URI(BASE_URI)
      uri.path = hash[:path]
      uri.query = URI.encode_www_form hash[:params]
      open(uri).read.split
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

    def ip
      uri = URI('http://whatismyip.akamai.com')
      open(uri).read.strip
    end
  end
end