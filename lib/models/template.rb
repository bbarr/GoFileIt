class Template < Mote::Document
  include Mote::Keys
  include GFI::Helpers::Model
  
  key :user_id
  
  key :name
  key :description
  key :fields, :default => []
   
end