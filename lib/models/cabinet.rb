class Cabinet
  
  class << self
    
    def forms_by user
      return @forms unless @forms.nil?
      
      user = [user] unless user.is_a? Array
      @forms = user.map { |u| ::Form.find({'user_id' => u['_id']}).to_a }.flatten 
    end
    
    def documents_by user
      return @documents unless @documents.nil?
      
      user = [user] unless user.is_a? Array
      form_ids = forms_by(user).map { |f| f['_id'] }
      @documents = user.map { |u| ::Document.find({ 'form_id' => { '$in' => form_ids } }) }
    end
  
  end
end