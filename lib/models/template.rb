class Template < Mote::Document
  include Mote::Keys
  
  key :user_id
  
  key :name
  key :description
  key :fields, :default => []
   
end