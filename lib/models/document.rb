class Document < Mote::Document
  include Mote::Keys
  include Mote::Callbacks
  
  key :template_id
  key :values, :default => []
  
  before_save :fields_to_values
  
  def template
    @template ||= Template.find_one({ '_id' => template_id })
  end
  
  def fields
    return @fields unless @fields.nil?
    
    # grab real field objects from document template list of field ids
    @fields = template.fields.map { |id| Field.find_one({ '_id' => id }) }
    values_to_fields
  end
  
  def populate params
    self.fields.each { |f| f.populate params }
  end
  
  def validate
    self['errors'] = fields.map { |f| f.errors unless f.errors.empty? }.delete_if { |e| e.nil? }.flatten
  end

  private
  
    def fields_to_values
      self['values'] = fields.map { |f| f.value }
    end
  
    def values_to_fields
      self['values'].each_with_index do |v, i|
        fields[i].populate v
      end
    end
    
end