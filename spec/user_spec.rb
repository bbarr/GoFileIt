require "spec_helper.rb"

describe User do
  
  before :each do
    @user = User.new :name => 'Brendan', :email => 'bbarr@bbarr.com'
  end
  
  after :each do
    User.collection.drop
  end
  
end