module GFI
  class Public < Base
    
    get "/" do
      haml :index
    end
    
    get "/about" do
      haml :about
    end
    
    get "/contact" do
      haml :contact
    end
    
  end
end