module GFI
  class FieldSet
    
    attr_accessor :fields
     
    def initialize field_ids
      self.fields = field_ids.map { |id| Field.find_one({ '_id' => id }) }
    end
  
    def flush_data
      data = {}
      fields.each { |f| data[f.name] = f.flush_data if f.populated }
      data
    end
    
    def flush_errors
      fields.map { |f| f.flush_errors }
    end
    
  end
end