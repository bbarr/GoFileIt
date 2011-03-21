require "spec_helper.rb"

describe Template do

  before :each do
    @user = User.create :name => 'bbarr', :email => 'b@barr.com'
    @template = Template.new :user_id => @user['_id'], :name => 'test'
    @field = Field.create :name => 'a field'
  end
  
  after :each do
    User.collection.drop
    Template.collection.drop
    Field.collection.drop
    Document.collection.drop
  end
  
  it "should associate with a user" do    
    User.find_one({'_id' => @template.user_id}).should == @user
  end
  
  it "should be able to add a field to end of template" do
    @template.add @field
    @template.fields[0].should == @field['_id']
  end
  
  it "should be able to add a field to a specific position in a template" do
    name = Field.create :name => 'name'
    email = Field.create :name => 'email'
    @template.add name
    @template.add email
    @template.add @field, 1
    @template.fields[1].should == @field['_id']
  end
  
  it "should be able to remove a field" do
    @template.add @field
    @template.fields.count.should == 1
    @template.remove @field
    @template.fields.count.should == 0
  end
  
  it "should be able to create a document" do
    @template.add @field
    doc = @template.to_doc
    doc.should be_a Document
  end
  
  it "should be able to populate a new document" do
    @template.add @field
    params = { 'a field' => 'a value' }
    doc = @template.to_doc
    doc.data['a field'].should == 'a value'
  end
  
end