require 'simplecov'
require 'codeclimate-test-reporter'
ENV['CODECLIMATE_REPO_TOKEN'] = "0752eb729c8348842c8b66cfd1879d03bb0861acce90c923435015a40ec617a2"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
]
SimpleCov.start

require File.expand_path("../../lib/random_org_http_api", __FILE__)
