require_relative 'engine'

class Car

  attr_reader :current_speed

  ACCELERATION = {:quickly => 3, :normal => 2, :slowly => 1}

  def initialize
    @engine = Engine.new
    @current_speed = 0
  end

  def accelerate_to(desired_speed,how_quickly)
    if ACCELERATION.include?(how_quickly)
      if @engine.gear == :drive
        ACCELERATION[how_quickly].times do
          self.increase_rpms
        end

        started_accelerating = Time.now

        until @current_speed >= desired_speed
          speeding_up(started_accelerating)
          puts "Getting faster, now at #{@current_speed} mph."
          sleep(0.5)
        end
        puts "It took #{Time.now - started_accelerating} seconds to reach speed."
      else
        puts "Ummm, the car has to be in gear to accelerate..."
      end
    else
      puts "I have no idea how to accelerate like #{how_quickly}..."
    end
  end


  def stop
    until @engine.rpms == 0
      decrease_rpms
    end
    @current_speed = 0
  end

  def print_info
    puts
    puts "The engine is currently \"#{@engine.running ? "on" : "off"}\""
    puts "And the car is currently in \"#{@engine.gear}\""
    puts "And the current speed is \"#{@current_speed}\""
    puts
  end

  private

  def speeding_up(started)
    total_acceleration_time = Time.now - started
    @current_speed = (total_acceleration_time * ((@engine.rpms / 1000) * 10)).to_i
  end

  def method_missing(name, *args)
    @engine.send(name,*args) if Engine.instance_methods(false).include?(name)
  end

end
