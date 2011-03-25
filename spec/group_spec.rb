require "spec_helper.rb"

describe Group do
  
  before :each do
    @user = User.create :name => "brendan", :email => "bbarr@bbarr.com"
    @group = Group.create :name => 'a group'
    @group.add @user
  end
  
  after :each do
    User.collection.drop
    Group.collection.drop
  end
  
  it "should require name to be unique" do
    dup = Group.new :name => 'a group'
    dup.save
    dup.errors['name'].should == 'Name must be unique'
  end
  
  it "should create group with initial user" do
    @group.users[0][:user_id].should == @user['_id']
  end
  
  it "should add an additional user with a specified rank" do
    new_user = User.create :name => 'foo', :email => 'c@d.com'
    @group.add(new_user, 2)
    @group.users[1][:rank].should == 2
  end
  
  it "should remove a user" do
    @group.remove @user['_id']
    @group.users.count.should == 0
  end
  
  it "should assign a default rank of 0 if not specified for new user" do
    @group.users[0][:rank].should == 0
  end
  
  it "should adjust the rank of an existing member" do
    @group.rank @user, 3
    @group.users[0][:rank].should == 3
  end
  
  it "should add its _id to its user's group property" do
    @user.group.should == @group['_id']
  end

end