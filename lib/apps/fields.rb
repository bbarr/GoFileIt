module GFI
  class Fields < Base
    
    get "/" do
      content_type :json
      Form.all.to_json
    end
    
  end
end