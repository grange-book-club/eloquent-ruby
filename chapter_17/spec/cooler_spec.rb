require 'cooler'

describe Cooler do
  let(:fridge) { Cooler.new }
  it "should be empty to start out" do
    fridge.beverages.should be_nil
  end

  it "should have an array of beverages" do
    fridge.beverages = [
      { :type => :beer, :brewery => 'Left Hand', :name => 'Milk Stout'},
      { :type => :beer, :brewery => 'Bells', :name => 'Hopslam'} 
    ]
    fridge.beverages.should have(2).things
  end

  it 'it should tell me how many beers i have' do
    fridge.beverages = [
      { :type => :beer, :brewery => 'Left Hand', :name => 'Milk Stout'},
      { :type => :beer, :brewery => 'Bells', :name => 'Hopslam'} 
    ]
    fridge.beer_count.should == 2
  end

  it 'should give me a beer list' do
    fridge.beverages = [
      { :type => :beer, :brewery => 'Left Hand', :name => 'Milk Stout'},
      { :type => :beer, :brewery => 'Bells', :name => 'Hopslam'} 
    ]
    beer_list = []
    fridge.each_beer { |beer| beer_list << "#{beer[:name]} brewed by #{beer[:brewery]}"}
    beer_list[0].should == 'Milk Stout brewed by Left Hand'
  end
end
