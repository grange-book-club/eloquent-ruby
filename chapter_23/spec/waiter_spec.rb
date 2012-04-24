require 'waiter'

describe Waiter do
  let(:waiter) { Waiter.new }

  it "should be of type Waiter" do
    waiter.class.should == Waiter
  end

  it "should bring me beer" do
    waiter.bring_me_beer.should match "Here's the beer you ordered."
  end

  it "should bring me scotch" do
    waiter.bring_me_scotch.should match "Here's the scotch you ordered."
  end
end
