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

  it "should bring me whiskey" do
    waiter.bring_me_whiskey.should match "Here's the whiskey you ordered."
  end

  it "should bring me tequila" do
    waiter.bring_me_tequila.should match "Here's the tequila you ordered."
  end

  it "should respond to bring_me_beer" do
    waiter.respond_to?(:bring_me_beer).should be_true
  end

  it "should respond to bring_me_scotch" do
    waiter.respond_to?(:bring_me_scotch).should be_true
  end

  it "should not respond to bring_me_whiskey" do
    waiter.respond_to?(:bring_me_whiskey).should be_false
  end
end
