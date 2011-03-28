require "spec_helper.rb"

describe User do
  
  before :each do
    @user = User.new :name => 'Brendan', :email => 'bbarr@bbarr.com'
    @group = Group.create :name => 'an office'
  end
  
  after :each do
    User.collection.drop
    Group.collection.drop
    Form.collection.drop
  end
  
  it "should return array with just himself if co_users are accessed while not in a group" do
    @user.co_users[0].should == @user
  end
  
  it "should generate a list of its co_users (including itself) if in a group" do
    @group.add @user
    @user.co_users[0] == @user
  end
  
  it "should generate a list of all forms associated with the user" do
    @group.add @user
    co_user = User.create :name => 'Allison', :email => 'allison@allison.com'
    @group.add co_user
    
    test_form = Form.create :name => 'co_users form', :user_id => co_user['_id']
    Form.create :name => 'users form', :user_id => @user['_id']
    
    @user.forms.count.should == 1
    co_user.forms.count.should == 1
  end
  
end