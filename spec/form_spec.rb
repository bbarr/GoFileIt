require "spec_helper.rb"

describe Form do

  before :each do
    @user = User.create :name => 'bbarr', :email => 'b@barr.com'
    @form = Form.create :user_id => @user['_id'], :name => 'test'
  end
  
  after :each do
    User.collection.drop
    Form.collection.drop
  end
  
  it "should associate with a user" do    
    User.find_by_id(@form.user_id).should == @user
  end

  it "should return a list of associated documents" do
    doc = Document.create :form_id => @form['_id']
    @form.documents.to_a[0].should == doc
  end

end