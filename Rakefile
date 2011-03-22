require "rake"
require File.join(File.dirname(__FILE__), "lib/boot.rb");

task :truncate do
  User.collection.drop
end

task :seed do
  
  user = User.create(
    :name => "bbarr",
    :email => "bbarr@gmail.com"
  )
  
end