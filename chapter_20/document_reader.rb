class DocumentReader
  
  #opens up classes singleton class.  Allows you to specialize
  #the behavior of methods called on that SPECIFIC object
  class << self
    attr_reader :reader_classes
  end

  @reader_classes = []

  def self.read(path)
    reader = reader_for(path)
    return nil unless reader
    reader.read(path)
  end

  def self.reader_for(path)
    reader_class = DocumentReader.reader_classes.find do |klass|
      klass.can_read?(path)
    end
    return reader_class.new(path) if reader_class
    nil
  end

  def self.inherited(subclass)
    DocumentReader.reader_classes << subclass
  end

end

class PlainTextReader < DocumentReader
  def self.can_read?(path)
    /.*\.txt/ =~ path
  end

  def initilize(path)
    @path = path
  end

  def read(path)
    "I have read #{path} as TEXT."
  end

end

class YamlReader < DocumentReader
  def self.can_read?(path)
    /.*\.yaml/ =~ path
  end

  def initilize(path)
    @path = path
  end

  def read(path)
    "I have read #{path} as YAML."
  end

end

class XMLReader < DocumentReader
  def self.can_read?(path)
    /.*\.xml/ =~ path
  end

  def initilize(path)
    @path = path
  end

  def read(path)
    "I have read #{path} as XML."
  end

end


describe DocumentReader do
  it "should have 3 subclasses" do
    DocumentReader.reader_classes.count.should == 3
  end

  it "should return a 'YAML Reader'" do
    DocumentReader.reader_for("c:/myfile.yaml").class.name.should == "YamlReader"
  end

  it "should return a 'XML Reader'" do
    DocumentReader.reader_for("c:/myfile.xml").class.name.should == "XMLReader"
  end

  it "should return a 'PlainText Reader'" do
    DocumentReader.reader_for("c:/myfile.txt").class.name.should == "PlainTextReader"
  end

  it "should display 'I have read X as YAML'" do
    DocumentReader.read("c:/myfile.yaml").should == "I have read c:/myfile.yaml as YAML."
  end

  it "should display 'I have read X as XML'" do
    DocumentReader.read("c:/myfile.xml").should == "I have read c:/myfile.xml as XML."
  end

  it "should display 'I have read X as TEXT'" do
    DocumentReader.read("c:/myfile.txt").should == "I have read c:/myfile.txt as TEXT."
  end

end



