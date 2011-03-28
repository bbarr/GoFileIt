class Document < Mote::Document
  include Mote::Keys
  include Mote::Callbacks
  include Mote::Timestamps
  
  key :form_id
  key :values, :default => []
  key :actions, :default => []
  
  before_save :fields_to_values
  after_save :record_action
  
  def form
    @form ||= Form.find_by_id form_id
  end
  
  def fields
    return @fields unless @fields.nil?
    @fields = form.fields.map { |id| Field.find_by_id id }
    values_to_fields
    @fields
  end
  
  def populate params
    self.fields.each { |f| f.populate params }
  end
  
  def validate
    self['errors'] = fields.map { |f| f.value_errors unless f.value_errors.empty? }.delete_if { |e| e.nil? }.flatten
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
   
    def record_action
      current_user = User.find_one
      new_action = [ current_user['name'] ]
      new_action.concat self['actions'].count == 0 ? [ 'Created', self['created_at'] ] : [ 'Edited', self['updated_at'] ]
      self['actions'] << new_action
      update
    end
    
end