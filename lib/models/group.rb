class Group < Mote::Document
  include Mote::Keys
  
  key :name
  key :users, :default => []
  
  def validate
    errors['name'] = 'Name must be unique' unless Group.find_one(:name => self['name'])
  end
  
end
