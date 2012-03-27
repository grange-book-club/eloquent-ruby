class Cooler
  attr_accessor :beverages
  attr_accessor :fruits
  attr_accessor :vegetables
  attr_accessor :meats

  def beer_count
    beer_count = 0
    self.beverages.each { |bev| (beer_count+=1) if (bev[:type] == :beer) }
    beer_count
  end
end
