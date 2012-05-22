require '../lib/Airship_class.rb'
require '../lib/location_class.rb'
include Location

describe AirShip do
  let(:ship) {AirShip.new}

  it "should start with 5 fuel and 30 money" do
    ship.money.should == 30
    ship.fuel_tank.should == 5
  end

  it "should refill the tank by 3 units when refilled" do
    ship.fill_tank
    ship.fuel_tank.should == 8
  end

  it "should cost 2 fuel and earn money when adventuring" do
    ship.go_adventuring
    ship.fuel_tank.should == 3
    ship.money.should > 30
  end

  it "should cost 1 fuel to travel to a new location" do
    ship.travel_to("location1")
    ship.fuel_tank.should == 4
  end

  it "should crash if the fuel runs out" do
    begin
      ship.go_adventuring
      ship.travel_to("location1")
      ship.go_adventuring
    rescue exception
      exception.should == "boom!"
    end
  end

  it "should have different costs for fuel at different locations" do
    at("location1") { $fuel_cost.should == 1 }
    at("location2") { $fuel_cost.should == 2 }
    at("location3") { $fuel_cost.should == 3 }
  end

  it "should only allow valid locations" do
    begin
      at("Nebraska") { ship.go_adventuring }
    rescue RuntimeError => exception
      exception.to_s.should == "that location doesn't exist!"
    end
  end
end

