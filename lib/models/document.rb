module GFI    
  class Document < ::Mongomatic::Base
    
    def collection_name 
      "Documents" 
    end

  end
end