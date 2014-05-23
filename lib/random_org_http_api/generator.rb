module RandomOrgHttpApi
  class Generator
    require 'net/http'
    include RandomOrgHttpApi::Configuration

    def generate_integers(params = {})
      request('integer', params)
    end

    def generate_strings(params = {})
      request('string', params)
    end

    def generate_sequence(params = {})
      request('sequence', params)
    end

    private

    # Метод запроса на сайт random.org
    def request(object_type, params)
      # В зависимости от типа получаемого объекта валидируем параметры и подставляем в нужный темплейт
      case object_type
        when 'integer' then
          all_params = permit_params(DEFAULT_QUERY_PARAMS, params, INTEGER_QUERY_PARAMS)
          query  = generate_query(all_params, INTEGER_QUERY_TEMPLATE)
        when 'string' then
          all_params = permit_params(DEFAULT_QUERY_PARAMS, params, STRING_QUERY_PARAMS)
          query  = generate_query(all_params, STRING_QUERY_TEMPLATE)
        when 'sequence' then
          all_params = permit_params(DEFAULT_QUERY_PARAMS, params,  SEQUENCE_QUERY_PARAMS)
          query  = generate_query(all_params, SEQUENCE_QUERY_TEMPLATE)
      end
      # Создаем запрос и возвращаем ответ.
      Net::HTTP.get(DOMAIN, query).split
    end

    # Метод оставляющий только нужные параметры.
    def permit_params(default_params, params, required_params )
      @params = default_params.merge(params)
      @params = @params.select {|k,v| required_params.include?(k) }
    end

    # Метод подстановки параметров в темплейт. Параметр должен быть хешем.
    def generate_query(params, template)
      template % params
    end

  end
end