class Action < Mote::Document
  include Mote::Keys
  include Mote::Timestamps
  
  key :user_id
  key :action_type
  
end