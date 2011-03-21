class Document < Mote::Document
  include Mote::Keys
  
  key :template_id
  key :data, :default => {}
  
end