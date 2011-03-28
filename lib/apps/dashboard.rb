module GFI
  class Dashboard < Base
    
    get "/" do
      
      @forms = Form.find({ 'user_id' => { '$in' => current_user.co_users.map { |u| u['_id'] } } }).to_a
      @documents = Document.find({ 'form_id' => { '$in' => @forms.map { |f| f['_id'] } } }).to_a
      
      haml :"dashboard/index"
    end
    
  end
end