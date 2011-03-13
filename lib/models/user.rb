module GFI    
  class User < ::Mongomatic::Base
    
    def collection_name "Users" end
    
    def validate
      self.errors.add "email", "can't be empty" if self.email.blank?
    end
  end
end