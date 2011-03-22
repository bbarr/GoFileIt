module GFI
  class Dashboard < Base
    
    get "/" do
      @user = User.find_one
      haml :"dashboard/index"
    end
    
  end
end