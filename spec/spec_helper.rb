require 'rubygems'
require 'bundler/setup'
require 'random_org_http_api'
require 'codeclimate-test-reporter'
require 'coveralls'
require 'simplecov'


SimpleCov.start
CodeClimate::TestReporter.start
Coveralls.wear!