module GFI
  class Dashboard < Base
    
    get "/" do
      @forms = user.find_forms
      @documents = @forms.find_documents
      haml :"dashboard/index"
    end
    
  end
end