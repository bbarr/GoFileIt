class Template < Base
  
  key :user_id
  
  key :name
  key :description
  key :fields, :default => []
  
end