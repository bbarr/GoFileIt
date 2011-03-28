module GFI
  class Dashboard < Base
    
    get "/" do
      
      @forms = Cabinet.forms_by current_user.co_users
      @documents = Cabinet.documents_by current_user.co_users
      
      haml :"dashboard/index"
    end
    
  end
end