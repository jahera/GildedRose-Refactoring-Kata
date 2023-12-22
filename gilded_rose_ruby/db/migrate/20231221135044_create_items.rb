class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string "name", limit: 255
      t.integer "quality"
      t.integer "sell_in"
      
      # t.decimal "quantity", precision: 12, scale: 2
      # t.decimal "sell_in", precision: 12, scale: 2
      t.timestamps
    end
  end
end
