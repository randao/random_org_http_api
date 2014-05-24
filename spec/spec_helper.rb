require 'rubygems'
require 'bundler/setup'
require 'random_org_http_api'
require 'codeclimate-test-reporter'
require 'coveralls'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter,
    CodeClimate::TestReporter::Formatter
]

SimpleCov.start
CodeClimate::TestReporter.start