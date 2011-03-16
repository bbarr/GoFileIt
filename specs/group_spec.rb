require "spec_helper.rb"

describe Group do
  
  before :each do
    @user = User.create :name => "brendan", :email => "bbarr@bbarr.com"
    @group = Group.create :name => 'a group', :users => @user
  end
  
  after :each do
    User.collection.drop
    Group.collection.drop
  end
  
  it "should require name to be unique" do
    dup = Group.create :name => 'a group'
    dup.errors['name'].should == 'Name must be unique'
  end
  
  it "should create group with initial user" do
    
    @group.users[0][:user_id].should == @user['_id']
  end
    
end