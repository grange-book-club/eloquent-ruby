require 'austin_beer'
require 'austin_beer_module'
require 'austin_beer_class'

describe AustinBeer do
  let(:austin_beer) { AustinBeer.new }
  let(:austin_beer_module) { AustinBeerWithModule.new }

  austin_beers= ["512", "Adelberts", "Austin Beer Works"]

  it "should list the beer choices in Austin" do
    austin_beer.beer_choices(austin_beers).should == ["512", "Adelberts", "Austin Beer Works" ]
  end

  it "should list the beer choices in Austin using the mixin" do
    austin_beer_module.beer_choices(austin_beers).should == ["512", "Adelberts", "Austin Beer Works" ]
  end

  it "should list the beer choices in Austin using the class method" do
    AustinBeerWithClass.beer_choices(austin_beers).should == ["512", "Adelberts", "Austin Beer Works" ]
  end
end
