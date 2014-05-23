# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'random_org_http_api/version'

Gem::Specification.new do |spec|
  spec.name          = "random_org_http_api"
  spec.version       = RandomOrgHttpApi::VERSION
  spec.authors       = ["Temur Fatkulin"]
  spec.email         = ["temur.fatkulin@gmail.com"]
  spec.summary       = %q{Realization of old HTTP API provided by the random.org service}
  spec.description   = %q{At present realized generation for numbers, strings and sequences}
  spec.homepage      = "https://github.com/istickz/random_org_http_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
