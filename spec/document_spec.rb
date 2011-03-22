require "spec_helper.rb"

describe Document do
  
  before :each do
    @template = Template.create :name => 'a template'
    email = Field.create :name => 'email'
    username = Field.create :name => 'username'
    @template.fields.push username['_id']
    @template.fields.push email['_id']
    @template.save
    @document = Document.create :template_id => @template['_id']
  end
  
  after :each do
    Template.collection.drop
    Document.collection.drop
    Field.collection.drop
  end
  
  it "should associate with a given template" do
    @document.template_id.should == @template['_id']
  end
  
  it "should build a list of field objects based on template list of field ids" do
    @document.fields.each do |f|
      f.is_a?(Field).should == true
      @template.fields.include?(f['_id']).should == true
    end
  end
  
  it "should pass any existing document values into new list of field objects" do
    @document.populate({ 'username' => 'bbarr' })
    @document.save
    doc = Document.find_one({ '_id' => @document['_id'] })
    doc.fields[0].value.should == 'bbarr'
  end
  
  it "should pass any field values back into document values array before saving" do
    @document.populate({ 'username' => 'bbarr' })
    @document.values[0].should == nil
    @document.save
    @document.values[0].should == @document.fields[0].value
  end
  
  it "should populate its value array with incoming key-value data" do
    params = { 'email' => 'email@domain.com' }
    @document.populate params
    @document.save
    @document.values[1].should == 'email@domain.com'
  end
  
  it "should maintain a value if not overriden by incoming key-value data" do
    params = { 'email' => 'email@domain.com' }
    @document.populate params
    @document.save    
    @document.values[0].should == ''
    @document.values[1].should == 'email@domain.com'
    more_params = { 'username' => 'bbarr' }
    @document.populate more_params
    @document.save
    @document.values[0].should == 'bbarr'
    @document.values[1].should == 'email@domain.com'
  end
  
end