class Form < Mote::Document
  include Mote::Keys
  include Mote::Timestamps
  
  key :user_id
  
  key :name
  key :description
  key :fields, :default => []
  
  def documents
    return @documents unless @documents.nil?
    save if self['_id'].nil?
    @documents = Document.find({ 'form_id' => self['_id'] })
  end
  
  def user
    return @user unless @user.nil?
    @user = User.find_by_id self['user_id']
  end
   
end