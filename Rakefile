require "rake"
require File.join(File.dirname(__FILE__), "lib/boot.rb");

task :truncate do
  User.collection.drop
  Group.collection.drop
end

task :seed do
  
  user = User.create(
    :name => "bbarr",
    :email => "bbarr@gmail.com"
  )
  
  group = Group.create :name => 'dentists'
  group.add [user]
  
end