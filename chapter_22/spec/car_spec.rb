require 'spec_helper'
require 'car'

describe Car do
  let(:car) {Car.new}
  let(:ready) do
    car = Car.new
    car.start
    car.change_gear(:drive)
    car
  end

  it "creating a car correctly sets up values" do
    car.instance_variable_get(:@engine).class.should == Engine
    car.current_speed.should == 0
  end

  it "accelerate_to 15 will change current_speed to 15" do
    ready.current_speed.should == 0
    out = capture_stdout do
      ready.accelerate_to(15,:quickly)
    end
    ready.current_speed.should == 15
  end

  it "accelerate_to with an invalid how_quickly results in a message" do
    out = capture_stdout do
      ready.accelerate_to(60,:warp_speed)
    end
    out.string.chomp.should == "I have no idea how to accelerate like warp_speed..."
  end

  it "accelerate_to when not in drive will result in a message" do
    ready.instance_variable_get(:@engine).instance_variable_set(:@gear, :neutral)
    out = capture_stdout do
      ready.accelerate_to(60,:quickly)
    end
    out.string.chomp.should == "Ummm, the car has to be in gear to accelerate..."
  end

  it "accelerate_to 15 with :quickly will do it in less than 1.5 sec" do
    ready.current_speed.should == 0
    start_time = Time.now
    out = capture_stdout do
      ready.accelerate_to(15,:quickly)
    end
    end_time = Time.new
    (end_time - start_time).should < 1.5
  end

  it "accelerate_to 15 with :normal will do it in less than 2.5 sec" do
    ready.current_speed.should == 0
    start_time = Time.now
    out = capture_stdout do
      ready.accelerate_to(15,:normal)
    end
    end_time = Time.new
    (end_time - start_time).should < 2.5
  end

  it "accelerate_to 15 with :slowly will do it in less than 3.5 sec" do
    ready.current_speed.should == 0
    start_time = Time.now
    out = capture_stdout do
      ready.accelerate_to(15,:slowly)
    end
    end_time = Time.new
    (end_time - start_time).should < 3.5
  end

  it "stop will set current_speed to 0" do
    ready.instance_variable_set(:@current_speed, 10)
    ready.stop
    ready.current_speed.should == 0
  end

  it "stop will correctly decrement rpms to 0" do
    ready.instance_variable_set(:@current_speed, 10)
    ready.instance_variable_get(:@engine).instance_variable_set(:@rpms, 1000)
    ready.stop
    ready.instance_variable_get(:@engine).rpms.should == 0
    ready.current_speed.should == 0
  end

  it "speeding_up with a 1 sec gap, will increase current_speed by 10 if rpms are 1000" do
    ready.instance_variable_get(:@engine).instance_variable_set(:@rpms, 1000)
    start_time = Time.now
    sleep(1)
    ready.send("speeding_up",start_time)
    ready.current_speed.should == 10
  end
end

