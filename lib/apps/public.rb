module GFI
  class Public < Base
    
    get "/" do
      @user = User.find_one
      haml :index
    end
    
  end
end