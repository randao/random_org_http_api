module RandomOrgHttpApi
  module Configuration
    DOMAIN = 'https://www.random.org'
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
    }

    # Query templates
    # Integer
    INTEGER_QUERY_KEYS = [:num, :min, :max, :col, :base, :format, :rnd]
    INTEGER_QUERY_TEMPLATE = "integers/?num=%{num}&min=%{min}&max=%{max}&col=%{col}&base=%{base}&format=%{format}&rnd=%{rnd}"

    # String
    STRING_QUERY_KEYS = [:num, :len, :digits, :upperalpha, :loweralpha, :unique, :format, :rnd]
    STRING_QUERY_TEMPLATE = "strings/?num=%{num}&len=%{len}&digits=%{digits}&upperalpha=%{upperalpha}&loweralpha=%{loweralpha}&unique=%{unique}&format=%{format}&rnd=%{rnd}"

    # Sequence
    SEQUENCE_QUERY_KEYS = [:min, :max, :col, :format, :rnd]
    SEQUENCE_QUERY_TEMPLATE = "sequences/?min=%{min}&max=%{max}&col=%{col}&format=%{format}&rnd=%{rnd}"

  end
end