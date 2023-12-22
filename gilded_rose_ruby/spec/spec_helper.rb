# spec/spec_helper.rb

ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require 'active_record'
require_relative '../app'  # Adjust the path as needed
require_relative '../models/item'  # Adjust the path as needed

# Configure RSpec to use Rack::Test
module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Configure ActiveRecord
  ActiveRecord::Base.establish_connection(
    YAML.load(File.read('config/database.yml'))['test']
  )

  # Run migrations before each test
  ActiveRecord::Migration.maintain_test_schema!
end
