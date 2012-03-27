require 'boulder_beer'
require 'boulder_beer_module'
require 'boulder_beer_class'
require 'boulder_beer_module_two'

describe BoulderBeer do
  let(:boulder_beer) { BoulderBeer.new }
  let(:boulder_beer_module) { BoulderBeerWithModule.new }
  let(:boulder_beer_module_two) { BoulderBeerWithModuleTwo.new }

boulder_beers = ["Asher", "Boulder Beer", "Avery" ]

  it "should list the beer choices in Boulder" do
    boulder_beer.beer_choices(boulder_beers).should == ["Asher", "Boulder Beer", "Avery" ]
  end

  it "should list the beer choices in Boulder using the mixin" do
    boulder_beer_module.beer_choices(boulder_beers).should == ["Asher", "Boulder Beer", "Avery" ]
  end

  it "should list the beer choices in Boulder using the class method" do
   BoulderBeerWithClass.beer_choices(boulder_beers).should == ["Asher", "Boulder Beer", "Avery" ]
  end

  it "should list the beer choices if module method is overridden" do
   boulder_beer_module_two.beer_choices(boulder_beers).should == ["Asher", "Boulder Beer", "Avery", "My New Beer"]
  end
end
