class Field < Mote::Document
  include Mote::Keys
  key :user_id
  
  key :name
  key :value
  key :data
  key :rules, :default => []
  
end
