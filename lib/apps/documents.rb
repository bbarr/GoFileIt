module GFI
  class Documents < Base
    
    get "/" do
      @docs = Document.all
      haml :"documents/index"
    end
    
    get "/:type" do
      content_type :json
      Document.find(:type => params[:type]).to_a.to_json
    end
    
    get "/:id" do
      content_type :json
      
    end
    
    delete "/:id" do
      
    end
    
    put "/:id" do
      
    end
    
  end
end