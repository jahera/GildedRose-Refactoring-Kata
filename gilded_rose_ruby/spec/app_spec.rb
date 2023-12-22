require 'spec_helper'
require 'pry'
require_relative '../gilded_rose'

RSpec.describe GildedRose do

  describe '.update_quality' do
    context 'with various items' do
      before(:each) do
        # Database is clean before each test
        Item.destroy_all
      end

      it 'updates the quality and sell_in correctly' do
        # Create test items in the database
        items_data = [
          {name:'Aged Brie', sell_in: 5, quality:10},
          {name:'Backstage passes to a TAFKAL80ETC concert', sell_in:15, quality: 20},
          {name:'Sulfuras, Hand of Ragnaros', sell_in:0, quality:80},
          {name:'Conjured Mana Cake', sell_in:3, quality:6}
        ]
        Item.create(items_data)

        # Get all items
        items = Item.all

        GildedRose.update_quality(items)
        expect(items[0].quality).to eq(11) # Aged Brie increases in quality
        expect(items[0].sell_in).to eq(4)

        expect(items[1].quality).to eq(21) # Backstage passes increases in quality
        expect(items[1].sell_in).to eq(14)

        expect(items[2].quality).to eq(80) # Sulfuras quality doesn't change
        expect(items[2].sell_in).to eq(0)

        expect(items[3].quality).to eq(4)  # Conjured item degrades twice as fast
        expect(items[3].sell_in).to eq(2)
      end
    end
  end
end
