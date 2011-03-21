class Template < Mote::Document
  include Mote::Keys
  
  key :user_id
  
  key :name
  key :description
  key :fields, :default => []
  
  def add field, pos=nil
    pos ||= fields.count
    field_id = get_id field
    fields.insert pos, field_id
  end
  
  def remove field
    field_id = get_id field
    fields.delete field_id
  end
    
  def populate data
    
  end
  
  def to_doc id=nil
    
    data = flush_data
    errors = flush_errors
    return false unless errors.empty?
    
    doc = id ? Document.find_one({ '_id' => id }) : Document.new(:template_id => self['_id'])
    doc.data.merge! data
    doc.save
    doc
  end
  
  def field_errors
    @field_errors
  end
  
  private
  
    def field_set
      @field_set ||= fields.map { |id| Field.find_one({ '_id' => id }) }
    end
    
    def flush_data
      data = {}
      field_set.each { |f| data[f.name] = f.flush_data if f.populated }
      data
    end
    
    def flush_errors
      field_set.map { |f| f.flush_errors }
    end
    
end