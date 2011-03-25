class Group < Mote::Document
  include Mote::Keys
  
  key :name
  key :users, :default => []
  
  def validate
    current = Group.find_one({ :name => self['name'] })
    if current
      errors['name'] = 'Name must be unique' unless current['_id'] == self['_id']
    end
  end
  
  def add user, rank=0
    
    # must have an id to assign to any incoming users
    self.save if self['_id'].nil?
    
    user.group = self['_id']
    user.save
    
    users << { :user_id => user['_id'], :rank => rank }
    
    self.save
  end
  
  def remove user
    id = get_id user
    users.delete_if { |u| u[:user_id] == id }
    
    self.save
  end
  
  def rank user, rank
    id = get_id user
    users.each { |u| u[:rank] = rank if u[:user_id] == id }
    
    self.save
  end
      
end
