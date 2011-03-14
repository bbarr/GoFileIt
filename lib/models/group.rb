module GFI    
  class Group < ::Mongomatic::Base
    
    def collection_name 
      "Groups" 
    end
    
  end
end