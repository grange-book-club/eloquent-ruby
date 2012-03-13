require 'equality_object'

describe EqualityObject do
  let(:equalityTester) { EqualityObject.new }
  let(:alteredString) { AlteredString.new }
  
  context "How === compares objects" do
    it "Will return false if the objects do NOT equal each other" do
      x = "string"
      y = "NOT_string"
      equalityTester.triple_equal_signs(x, y).should == false
    end

    it "Will return true if the objects do NOT point to the same Object" do
      x = "string"
      y = "string"
      equalityTester.triple_equal_signs(x, y).should == true 
    end

    it "Will return true if the objects do point to the same Object" do
      x = "string"
      y = x
      equalityTester.triple_equal_signs(x, y).should == true
    end

    it "Will return false if the objects share a common ancestor and do NOT contain the same string" do
      alteredString = "string"
      x = "NOT_string"
      equalityTester.triple_equal_signs(alteredString, x).should == false
    end

    it "Will return true if the objects share a common ancestor and contain the same string" do
      alteredString = "string"
      x = "string"
      equalityTester.triple_equal_signs(alteredString, x).should == true 
    end

    it "Is used in case statements and will return true if the regex is found with the case" do
      longString = "stringWithNOTInTheMiddle"
      case longString
      when /NOT.*/
        answer = true
      else
        answer = false
      end

      answer.should == true
    end

    it "Is used in case statements and will NOT return true if the regex is not found with the case" do
      longString = "stringWithInTheMiddle"
      case longString
      when /NOT.*/
        answer = true
      else
        answer = false
      end

      answer.should == false
    end
  end
end
