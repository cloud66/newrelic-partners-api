# -*- encoding: utf-8 -*-
require File.expand_path("../lib/new_relic_partners_api/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "newrelic-partners-api"
  s.version     = NewRelicPartnersApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Khash Sajadi']
  s.email       = ['support@cloud66.com']
  s.homepage    = "http://rubygems.org/gems/newrelic-partners-api"
  s.summary     = "NewRelic Partners API"
  s.description = "Ruby gem for integration with NewRelic partners API"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "newrelic-partners-api"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
