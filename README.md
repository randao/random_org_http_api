# RandomOrgHttpApi

Realization of old [HTTP API](http://www.random.org/clients/http/) provided by the random.org service.  
Not to confuse to new [JSON-RPC API](https://api.random.org/json-rpc/1/) which now is in beta release.

At present realized:  

* generation of numbers
* generation of numbers
* generation of numbers


## Installation

Add this line to your application's Gemfile:

    gem 'random_org_http_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install random_org_http_api

## Usage

    require 'random_org_http_api'
    
    g = RandomOrgHttpApi::Generator.new

    g.generate_integers(num: 4, max: 100)
    => ["10", "23", "42", "28"]

    g.generate_strings(min: 1, max: 10, num: 3, len: 5)
    => ["XxH06", "3UHOu", "Asjd0"]

    g.generate_sequence(num: 5, len: 10, max: 10)
    => ["8", "9", "10", "3", "2", "7", "1", "5", "4", "6"]

## More available parameters for generate_* methods

### generate_integers

    :min
    :col
    :base
    :format
    :rnd


### generate_sequence

    :col
    :format
    :rnd

### generate_strings

    :digits
    :upperalpha
    :loweralpha
    :unique
    :format
    :rnd

More information about available parameters on [http://www.random.org/clients/http/](http://www.random.org/clients/http/)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/random_org_http_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
