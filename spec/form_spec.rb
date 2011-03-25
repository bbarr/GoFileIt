require "spec_helper.rb"

describe Form do

  before :each do
    @user = User.create :name => 'bbarr', :email => 'b@barr.com'
    @form = Form.new :user_id => @user['_id'], :name => 'test'
  end
  
  after :each do
    User.collection.drop
    Form.collection.drop
  end
  
  it "should associate with a user" do    
    User.find_by_id(@form.user_id).should == @user
  end

end