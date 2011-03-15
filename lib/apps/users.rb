module GFI
  class Users < Base
    
    get "/" do
      user = User.new(:name => 'brendan')
      user.save
    end
    
    get "/confirm/:hash" do
      
    end
    
  end
end