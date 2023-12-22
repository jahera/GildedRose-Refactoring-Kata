class GildedRose
  def self.update_quality(items)
    items.each do |item|
      case item.name
      when 'Aged Brie'
        update_aged_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_passes(item)
      when 'Sulfuras, Hand of Ragnaros'
        # Legendary item, no need to update
      when 'Conjured Mana Cake'
        update_conjured_item(item)
      else
        update_normal_item(item)
      end
    end
  end

  private

  def self.update_aged_brie(item)
    increase_quality(item)
    item.sell_in -= 1
    increase_quality(item) if item.sell_in < 0
    cap_quality(item)
  end

  def self.update_backstage_passes(item)
    increase_quality(item)
    increase_quality(item) if item.sell_in < 11
    increase_quality(item) if item.sell_in < 6
    item.sell_in -= 1
    item.quality = 0 if item.sell_in < 0
    cap_quality(item)
  end

  def self.update_conjured_item(item)
    decrease_quality(item, 2)
    item.sell_in -= 1
    decrease_quality(item, 2) if item.sell_in < 0
    cap_quality(item)
  end

  def self.update_normal_item(item)
    decrease_quality(item)
    item.sell_in -= 1
    decrease_quality(item) if item.sell_in < 0
    cap_quality(item)
  end

  def self.increase_quality(item)
    item.quality += 1 if item.quality < 50
  end

  def self.decrease_quality(item, amount = 1)
    item.quality -= amount if item.quality > 0
  end

  def self.cap_quality(item)
    item.quality = 50 if item.quality > 50
  end
end