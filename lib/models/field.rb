class Field < Base
  
  key :user_id
  
  key :name
  key :value
  key :data
  key :rules, :default => []
  
end
