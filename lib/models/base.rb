class Base < Mote::Document
  include Mote::Keys
  
  def get_user_id something
    return something if something.is_a? BSON::ObjectId
    return something['_id'] if something.is_a? User
    # raise exception
  end
  
end