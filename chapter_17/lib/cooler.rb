class Cooler
  attr_accessor :beverages
  attr_accessor :fruits
  attr_accessor :vegetables
  attr_accessor :meats

  def beer_count
    self.beers.size
  end

  def unwind
    
  end

  def beers
    self.beverages.select{|bev| bev[:type] == :beer}
  end

  def each_beer
    index = 0
    beers = self.beers
    while index < self.beer_count
      yield(beers[index])
      index += 1
    end
  end
end
