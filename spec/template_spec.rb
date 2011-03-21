require "spec_helper.rb"

describe Template do

  before :each do
    @user = User.create :name => 'bbarr', :email => 'b@barr.com'
    @template = Template.new :user_id => @user['_id'], :name => 'test'
  end
  
  after :each do
    User.collection.drop
    Template.collection.drop
  end
  
  it "should associate with a user" do    
    User.find_one({'_id' => @template.user_id}).should == @user
  end

end