module RandomOrgHttpApi
  module Configuration
    BASE_URI = 'https://www.random.org'.freeze

    DEFAULT_QUERY_PARAMS = {
      format: 'plain',
      base: '10',
      rnd: 'new',
      col: '1',
      min: '1',
      digits: 'on',
      loweralpha: 'on',
      upperalpha: 'on',
      unique: 'on'
    }.freeze

    QUERY_TEMPLATE = {
      integer: {
        path: '/integers',
        query_keys: [:num, :min, :max, :col, :base, :format, :rnd]
      },
      string: {
        path: '/strings',
        query_keys: [:num, :len, :digits, :upperalpha, :loweralpha, :unique, :format, :rnd]
      },
      sequence: {
        path: '/sequences',
        query_keys: [:min, :max, :col, :format, :rnd]
      }
    }.freeze
  end
end
