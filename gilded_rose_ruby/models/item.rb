class Item < ActiveRecord::Base
  self.table_name = 'items'
  # attr_accessor :name, :sell_in, :quality

  # def initialize(name, sell_in, quality)
  #   @name = name
  #   @sell_in = sell_in
  #   @quality = quality
  # end
end