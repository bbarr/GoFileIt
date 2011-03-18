class User < Base
  
  key :name
  key :email
  
  def validate
    errors['name'] = 'Must have name' if self['name'].nil?
    errors['email'] = 'Must have email' if self['email'].nil?
    errors['email'] = 'Email is already in use' unless User.find_one(:email => self['email']).nil?
  end
end