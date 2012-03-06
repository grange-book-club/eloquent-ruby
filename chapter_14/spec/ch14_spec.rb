# Code Location: C:\bookclub\eloquent_ruby\spec\chapter14\
# Specs filename: ch14_spec.rb
# File Location: C:\bookclub\eloquent_ruby\chapter14\spec\

require 'spec_helper'

#module Chapter14

describe DemoCh14 do
 
  # Test Instance of Class
  describe "#new" do
    it "takes one parameter and returns instance a DemoValue object" do
	  demoCh14 = DemoCh14.new "DemoValue"
	  demoCh14.should be_an_instance_of DemoCh14
	end
  end  
  
  # Test DemoCh14 Param (failing test)
  describe "#DemoValue" do
    it "returns correct DemoValue - Negative Expectation" do
	  demoCh14 = DemoCh14.new "TestParameter"
	  demoCh14.demoValue.should eql "DemoValue"
	end
  end    
  
  # Test DemoCh14 Param
  describe "#DemoValue" do
    it "returns correct DemoValue - Positive Expectation" do
	  demoCh14 = DemoCh14.new "TestParameter"
	  demoCh14.demoValue.should eql "TestParameter"
	end
  end     
  
  # Test Class Variables
  describe "#ClassVars" do
    it "returns demo Class Variables" do	  
	  classOne = DemoCh14.new "ClassVarDemo1"
	  classOne.view_class_var.should==11
	  classOne.view_class_var.should==12
	  classOne.view_class_var.should==13
	  
	  subClass = ChildDemoCh14.new "SubClass VarDemo3"
	  subClass.view_class_var.should==21
	  subClass.view_class_var.should==22
	  subClass.view_class_var.should==23
	 
	  classOne.view_class_var.should==14

	end
  end     
  
  
  # Test Class Instance Vars
  describe "#ClassInstanceVars" do
    it "returns demo Class Iteration Variables" do	  
	  classOne = DemoCh14.new "ClassIterationVarDemo1"
	  classOne.view_instance_class_var.should==101
	  classOne.view_instance_class_var.should==102
	  
	  subClass = ChildDemoCh14.new "ClassIterationVarDemo3"
	  subClass.view_instance_class_var.should==201
	  subClass.view_instance_class_var.should==202	  
	  
	  classOne.view_instance_class_var.should==203
	  
	  
	end
  end   
  
end  

#end
