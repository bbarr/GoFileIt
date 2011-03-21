class Field < Mote::Document
  include Mote::Keys
  
  key :user_id
  
  key :name
  key :type
  key :rules, :default => []

  attr_writer :value
  
  def value
    @value ||= ''
  end
  
  def populate params
    self.value = params[name] unless params[name].nil?
  end
  
end
