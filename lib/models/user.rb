class User < Mote::Document
  include Mote::Keys

  key :name
  key :email
  key :password
  key :group
  
  attr_accessor :rank
  
  def validate
    errors['name'] = 'Must have name' if self['name'].nil?
    errors['email'] = 'Must have email' if self['email'].nil?
    errors['email'] = 'Email is already in use' unless User.find_one(:email => self['email']).nil?
  end
  
  def co_users
    return @co_users unless @co_users.nil?
    
    return nil if self['group'].nil?

    group = Group.find_by_id self['group']

    @co_users = group['users'].map do |u|
      user = User.find_by_id u['user_id']
      user.rank = u['rank']
      user
    end
  end
  
  def find_forms
    users = co_users || [self]
    users.map { |u| Form.find({ 'user_id' => u['_id'] }).to_a }.flatten
  end
end