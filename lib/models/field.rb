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
  
  attr_writer :value_errors
  
  def value_errors
    @value_errors ||= []
  end
  
  def populate params
    self.value = params[name] unless params[name].nil?
    self.value = params if params.is_a? String
  end
  
end
