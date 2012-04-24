require 'spec_helper'
require 'engine'

describe Engine do
  let(:engine) {Engine.new}

  it "starts turned off, in neutral, with no engine rpms" do
    engine.running.should be_false
    engine.gear.should == :neutral
    engine.rpms.should == 0
  end

  it "calling start will turn the engine on" do
    engine.running.should be_false
    engine.start
    engine.running.should be_true
  end

  it "calling start with an already on engine, will not change the status" do
    engine.instance_variable_set(:@running, true)
    engine.running.should be_true
    engine.start
    engine.running.should be_true
  end

  it "calling turn_off while the engine is off, will not do anything" do
    engine.running.should be_false
    engine.turn_off
    engine.running.should be_false
  end

  it "calling turn_off while the engine is on, will turn it off" do
    engine.instance_variable_set(:@running, true)
    engine.running.should be_true
    engine.turn_off
    engine.running.should be_false
  end

  it "calling turn_off while the gear is not in neutral will return a message" do
    engine.instance_variable_set(:@gear, :drive)
    out = capture_stdout do
      engine.turn_off
    end
    out.string.chomp.should == "Do you know what you are doing?  The car should be in neutral not drive."
  end

  it "calling change_gear with an invalid gear will give a message" do
    out = capture_stdout do
      engine.change_gear(:dog)
    end
    out.string.chomp.should == "This engine does not have a \"dog\" gear."
  end

  it "change_gear with a valid gear while engine is off results in a message and no gear change" do
    out = capture_stdout do
      engine.change_gear(:drive)
    end
    out.string.chomp.should == "Silly kid, you can't change the gear while the engine is off!"
    engine.gear.should == :neutral
  end

  it "change_gear with > 0 rpms, but engine on will result in a message and no gear change" do
    engine.instance_variable_set(:@running, true)
    engine.instance_variable_set(:@rpms, 10)
    out = capture_stdout do
      engine.change_gear(:drive)
    end
    out.string.chomp.should == "You should really come to a complete stop before shifting."
    engine.gear.should == :neutral
  end

  it "change_gear with rpms = 0 and engine running will change the gear" do
    engine.instance_variable_set(:@running, true)
    engine.change_gear(:drive)
    engine.gear.should == :drive
  end

  it "increase_rpms will increment from 0 to 1000" do
    engine.rpms.should == 0
    engine.increase_rpms
    engine.rpms.should == 1000
  end

  it "increase_rpms will increment from 4000 to 5000" do 
    engine.instance_variable_set(:@rpms, 4000)
    engine.increase_rpms
    engine.rpms.should == 5000
  end

  it "increase_rpms will increment from 4001 to 5000" do
    engine.instance_variable_set(:@rpms, 4999)
    engine.increase_rpms
    engine.rpms.should == 5000
  end

  it "decrease_rpms will decrement from 1000 to 500" do
    engine.instance_variable_set(:@rpms, 1000)
    engine.decrease_rpms
    engine.rpms.should == 500
  end

  it "decrease_rpms will decrement from 500 to 0" do
    engine.instance_variable_set(:@rpms, 500)
    engine.decrease_rpms
    engine.rpms.should == 0
  end

  it "decrease_rpms will decrement from 499 to 0" do
    engine.instance_variable_set(:@rpms, 499)
    engine.decrease_rpms
    engine.rpms.should == 0
  end
end
