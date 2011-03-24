class User < Mote::Document
  include Mote::Keys
  include GFI::Helpers::Model  
  
  key :name
  key :email
  key :group, :default => false
  
  attr_accessor :rank
  
  def validate
    errors['name'] = 'Must have name' if self['name'].nil?
    errors['email'] = 'Must have email' if self['email'].nil?
    errors['email'] = 'Email is already in use' unless User.find_one(:email => self['email']).nil?
  end
  
  def co_users
    return @co_users unless @co_users.nil?
    group = self['group']
    return [] unless group
    @co_users = group['users'].map do |u|
      User.find_one({ '_id' => u.user_id })
    end
  end
end