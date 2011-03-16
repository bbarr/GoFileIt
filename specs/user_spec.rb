require "boot.rb"

describe User do
  
  before do
    @user = User.new(:name => 'Brendan', :email => 'bbarr@bbarr.com')
  end
  
  after do
    User.collection.drop
  end
  
  it "should require email to be unique" do
    
    @user.save
    
    dup = User.new(:name => 'Mike', :email => 'bbarr@bbarr.com')
    dup.save
    
    dup.errors['email'].should == 'Email is already in use'
  end
  
end