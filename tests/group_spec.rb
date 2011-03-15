require "boot.rb"

describe Group do
  
  before do
    @user = User.new :name => "brendan", :email => "bbarr@bbarr.com"
    @group = Group.new :name => 'a group', @user
  end
  
  after do
    Group.collection.drop
  end
  
  it "should require name to be unique" do
    
    @group.save
    
    dup = Group.new :name => 'a group'
    dup.save
    
    dup.errors['name'].should == 'Name must be unique'
  end
  
  it "should create group with initial user(s)" do
    @group.users = [@user]
  end
  
end