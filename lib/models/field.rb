class Field < Mote::Document
  include Mote::Keys
  include GFI::Validations
  
  key :user_id
  
  key :name
  key :value
  key :data
  key :rules, :default => []
  
  def validate
    self[:rules].each { |r| self[:value] unless r.nil? }
  end
  
end
