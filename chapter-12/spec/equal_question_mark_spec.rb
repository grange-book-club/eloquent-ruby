require 'equality_object'

describe EqualityObject do
  let(:equalityTester) { EqualityObject.new }
  let(:alteredString) { AlteredString.new }

  context "How 'equal?' compares objects" do
    it "Will return false if the objects do NOT equal each other" do
      x = "NOT_string"
      y = "string"
      equalityTester.equal_question_mark(x, y).should == false 
    end

    it "Will return false if the objects do NOT point to the same Object" do
      x = "string"
      y = "string"
      equalityTester.equal_question_mark(x, y).should == false 
    end

    it "Will return true if the objects point to the same Object" do
      x = "string"
      y = x
      equalityTester.equal_question_mark(x, y).should == true
    end

    it "Will return false if the objects share a common ancestor and do NOT contain the same string" do
      alteredString = "string"
      x = "NOT_string"
      equalityTester.equal_question_mark(alteredString, x).should == false
    end

    it "Will return false if the objects share a common ancestor and contain the same string" do
      alteredString = "string"
      x = "string"
      equalityTester.equal_question_mark(alteredString, x).should == false 
    end

    it "Will return true if the objects share a common ancestor and point to the same Object" do
      x = "string"
      alteredString = x
      equalityTester.equal_question_mark(alteredString, x).should == true
    end
  end
end
