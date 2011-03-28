require "rake"
require File.join(File.dirname(__FILE__), "lib/boot.rb");

task :truncate do
  User.collection.drop
  Group.collection.drop
  Document.collection.drop
  Form.collection.drop
end

task :seed do
  
  user = User.create(
    :name => "bbarr",
    :email => "bbarr@gmail.com"
  )
  
  group = Group.create :name => 'dentists'
  group.add user
  
  form = Form.create :name => 'a form', :user_id => user['_id']
  doc = Document.create :form_id => form['_id']
  
end