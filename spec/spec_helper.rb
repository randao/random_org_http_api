require 'rubygems'
require 'bundler/setup'
require 'random_org_http_api'
require 'codeclimate-test-reporter'
require 'coveralls'

Coveralls.wear!
CodeClimate::TestReporter.start