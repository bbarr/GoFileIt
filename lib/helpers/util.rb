def get_id something
  return something if something.is_a? BSON::ObjectId
  return something['_id'] unless something['_id'].nil?
  # raise exception
end