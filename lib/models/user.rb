module GFI    
  class User < ::Mongomatic::Base
    
    def self.collection_name
      "Users"
    end
    
    def validate
      self.errors.add :email, "can't be empty" if self['email'].blank?
      self.errors.add :password, "can't be empty" if self['password'].blank?
      self.errors.add :confirm_password, 'must match password' unless self['confirm_password'] == self['password']
    end
  end
end