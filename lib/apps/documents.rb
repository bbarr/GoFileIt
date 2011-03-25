module GFI
  class Documents < Base
    
    get "/" do
      content_type :json
      Document.all.to_a.to_json
    end
    
    delete "/:id" do
      
    end
    
    put "/:id" do
      
    end
    
  end
end