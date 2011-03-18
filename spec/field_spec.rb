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
    print ' first: ' + User.find_one.inspect
    #field = Field.new :user_id => @user['_id'], :name => 'test'
    print ' second: ' + User.find_one.inspect
    print ' third: ' + User.find_one.inspect
    print ' fourth: ' + User.find_one.inspect
    print ' fifth: ' + User.find_one.inspect
    print ' sixth: ' + User.find_one.inspect
    print ' seventh: ' + User.find_one.inspect
    print ' eighth: ' + User.find_one.inspect
                        
    User.find_one({'_id' => field.user_id}).should == @user
  end
  
end

first: #<User:0x0000010285e140 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000002')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')> 
second: #<User:0x000001028415b8 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000003')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')> 
third: #<User:0x0000010211bb58 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000004')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')> 
fourth: #<User:0x00000102101230 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000005')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')> 
fifth: #<User:0x000001020f3c98 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000006')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')> 
sixth: #<User:0x000001020ebca0 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000007')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')> 
seventh: #<User:0x000001020e2588 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000008')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')> 
eighth: #<User:0x000001020d08d8 @doc={"name"=>"bbarr", "email"=>"b@barr.com", "_id"=>BSON::ObjectId('4d83a988057510de58000009')}, @is_new=false, @_id=BSON::ObjectId('4d83a988057510de58000001')>