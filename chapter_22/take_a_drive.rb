require './lib/car'

car = Car.new
car.print_info
puts "----> Starting the car"
car.start
car.print_info
puts "----> Shifting into drive"
car.change_gear(:drive)
car.print_info
puts "----> Accelerate to 60"
car.accelerate_to(60,:quickly)
car.print_info
puts "----> Slow to a stop"
car.stop
car.print_info
puts "----> Accelerate to 60"
car.accelerate_to(60, :normal)
car.print_info
puts "----> You are here, stop and turn off the car"
car.stop
car.change_gear(:neutral)
car.turn_off
car.print_info
