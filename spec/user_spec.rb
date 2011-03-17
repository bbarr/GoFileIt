require "spec_helper.rb"

describe User do
  
  before do
    @user = User.new(:name => 'Brendan', :email => 'bbarr@bbarr.com')
  end
  
  after do
    User.collection.drop
  end
  
end