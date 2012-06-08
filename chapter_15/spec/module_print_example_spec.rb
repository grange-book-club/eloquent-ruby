require 'module_print_example'

class AttachToThis
  include ModulePrintExample
end

describe ModulePrintExample do
  it 'should use method from a module once included in' do
    test_class = AttachToThis.new
    test_class.print_method.should == "This is just a module"
  end

  it 'should not use a module method from a module once included' do
    test_class = AttachToThis.new
    message = ""
    begin
      test_class.print_module_method
    rescue NoMethodError
      message = "No Method error"
    end
    message.should == "No Method error"
  end

  it 'should not use a method without it being included into a class' do
    message = ""
    begin
      ModulePrintExample::print_method
    rescue NoMethodError
      message = "No Method error"
    end
    message.should == "No Method error"
  end


  it 'should use a module method without it being included into a class' do
    ModulePrintExample::print_module_method.should == 'This is a module method'
  end
end
