# File Name: ch14.rb
# File Location: C:\bookclub\eloquent_ruby\chapter14\ch14.rb
# C:\Users\c-slabom>rspec C:\bookclub\eloquent_ruby\chapter14\spec
#module Chapter14
  class DemoCh14
    #@@class_var = 0
  
    attr_accessor :demoValue
	  def initialize demoValue
	    @demoValue = demoValue
		@@class_var = 10
		@instance_class_var = 100
	  end
	 
	  def view_class_var
		@@class_var = @@class_var + 1
	  end

	  def view_instance_class_var	   
		@instance_class_var = @instance_class_var + 1
	  end
	  
  end
  
  
  class ChildDemoCh14 < DemoCh14
 
    attr_accessor :demoValue
	  def initialize demoValue
	    @demoValue = demoValue
		@@class_var = 20
		@instance_class_var = 200
	  end
	 
	  #def view_class_var
	#	@@class_var = @@class_var + 1
	 # end

	  def view_instance_class_var	    
		@instance_class_var = @instance_class_var + 1
	  end
	  
  end  
  
  
  
  
#end