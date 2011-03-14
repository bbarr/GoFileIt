module GFI
  class Users < Base
    
    get "/" do
      'accounts'
    end
    
    get "/confirm/:hash" do
      
    end
    
  end
end