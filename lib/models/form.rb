class Form < Mote::Document
  include Mote::Keys
  
  key :user_id
  
  key :name
  key :description
  key :fields, :default => []
  
  def self.find_by_user user
    user = [user] unless user.is_a? Array
    
  end
   
end