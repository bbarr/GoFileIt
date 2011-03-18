require "spec_helper.rb"

describe Field do
  
  before :each do
    @user = User.create :name => 'bbarr', :email => 'b@barr.com'
  end
  
  after :each do
    User.collection.drop
    Field.collection.drop
  end
  
  it "should associate with a user" do
    field = Field.new :user_id => @user['_id'], :name => 'test'
    User.find_one({'_id' => field.user_id}).should == @user
  end
  
end