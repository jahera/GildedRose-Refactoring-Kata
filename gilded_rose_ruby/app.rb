require 'sinatra'
require 'pry'
require 'sinatra/activerecord'
require_relative 'models/item'
require_relative 'gilded_rose'

set :port, 4567

# Configure ActiveRecord
ActiveRecord::Base.establish_connection(
  YAML.load(File.read('config/database.yml'))[ENV['RACK_ENV'] || 'development']
)

get '/' do
  # Retrieve items from the database
  items = Item.all

  # Update items using Gilded Rose logic
  GildedRose.update_quality(items)

  erb :index, locals: { items: items }
end
