module GFI
  class Forms < Base
    
    get "/" do
      content_type :json
      Form.all.to_json
    end
    
  end
end