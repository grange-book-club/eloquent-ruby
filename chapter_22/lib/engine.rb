class Engine

  attr_reader :gear,:running,:rpms

  GEARS = [:neutral, :drive, :reverse]

  def initialize
    @gear = :neutral
    @running = false
    @rpms = 0
  end

  def start
    @running = true
  end

  def turn_off
    if @gear == :neutral
      @running = false
    else
      puts "Do you know what you are doing?  The car should be in neutral not #{@gear}."
    end
  end

  def change_gear(gear)
    if GEARS.include?(gear)
      if @running
        if @rpms == 0
          @gear = gear
        else
          puts "You should really come to a complete stop before shifting."
        end
      else
        puts "Silly kid, you can't change the gear while the engine is off!"
      end
    else
      puts "This engine does not have a \"#{gear}\" gear."
    end
  end

  def increase_rpms
    @rpms <= 4000 ? @rpms += 1000 : @rpms = 5000
  end

  def decrease_rpms
    @rpms > 500 ? @rpms -= 500 : @rpms = 0
  end
end
