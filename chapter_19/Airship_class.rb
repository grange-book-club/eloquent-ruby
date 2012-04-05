class AirShip

  attr_accessor :fuel_tank
  attr_accessor :money

  def initialize
    @fuel_tank = 5
    @money = 30
  end
  
  def fill_tank
    if @money >= ($fuel_cost.to_i * 3)
      @fuel_tank += 3
      @money -= ($fuel_cost.to_i * 3)
      puts "Fuel at this location costs #{$fuel_cost.to_s} per unit."
      puts "You fill your fuel tank with 3 units and now have:"
      puts "  Money: #{@money}"
      puts "  Fuel:  #{@fuel_tank}"
    else
      puts "you can't afford more fuel! you should go adventuring for money!"
    end
  end

  def go_adventuring
    money_gained = rand(10)+1
    crash_if_empty_fuel_tank
    @fuel_tank -= 2
    @money += money_gained
    puts "You go adventuring, using 2 units of fuel and find:"
    puts "  Money Gained: #{money_gained}"
    puts "  Total Money:  #{@money}"
    puts "  Fuel Tank:    #{@fuel_tank}"
  end

  def travel_to location
    crash_if_empty_fuel_tank
    @fuel_tank -= 1
    puts "You travel to #{location}, using 1 unit of fuel."
    puts "Your fuel tank now has:"
    puts "  Fuel: #{@fuel_tank}"
  end

  def crash_if_empty_fuel_tank
    crash_airship if @fuel_tank <= 0
  end

  def crash_airship
    puts "Oh no! Your Airship has ran out of fuel and has crashed from the sky!"
    raise "boom!"
  end
end
