module BeerHelper
  def beer_choices(beers)
      beers.each { |b| b.to_s }
  end
end
