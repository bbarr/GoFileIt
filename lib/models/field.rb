class Field < Mote::Document
  include Mote::Keys
  
  key :user_id
  
  key :name
  key :type
  key :rules, :default => []

  attr_accessor :populated

  def instantiate_document hash
    super
    populated = false;
  end
  
  def errors
    @errors ||= {}
  end
  
  def value
    @value ||= ''
  end
  
  def accepts? v
    value = v
    true
  end
  
  def populate data
    populated = true
  end
  
  def flush
    populated = false
    v = value
    value = nil
    v
  end
  
end
