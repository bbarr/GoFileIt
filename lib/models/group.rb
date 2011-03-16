class Group < Mote::Document
  include Mote::Keys
  
  key :name
  key :users, :default => []
  
  def instantiate_document hash
    default_users = hash.delete :users
    super
    return if default_users.nil?
    default_users = [default_users] unless default_users.is_a? Array
    default_users.each { |u| add_user u['_id'] }
  end
  
  def add_user id, rank=0
    users.push({ :user_id => id, :rank => rank })
  end
  
  def validate
    errors['name'] = 'Name must be unique' unless Group.find_one(:name => self['name'])
  end
  
end
