class Group < Mote::Document
  include Mote::Keys
  include GFI::Helpers::Model
  
  key :name
  key :users, :default => []
  
  def instantiate_document hash
    default_users = hash.delete :users
    super
    add default_users unless default_users.nil?
  end
  
  def validate
    errors['name'] = 'Name must be unique' unless Group.find_one(:name => self['name']).nil?
  end
  
  def add user, rank=0
    
    # must have an id to assign to any incoming users
    self.save if self['_id'].nil?
    
    user = [user] unless user.is_a? Array
    user.each do |u| 
      u.group = self['_id']
      u.save
      users.push({ :user_id => get_id(u), :rank => rank })
    end
  end
  
  def remove user
    id = get_id user
    user = [user] unless user.is_a? Array
    user.each { |u| users.delete_if { |u| u[:user_id] == id } }
  end
  
  def rank user, rank
    id = get_id user
    users.each { |u| u[:rank] = rank if u[:user_id] == id }
  end
      
end
