# Generated by cucumber-sinatra. (2014-07-28 10:28:46 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/bookmark.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = BookMark

class BookMarkWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  BookMarkWorld.new
end