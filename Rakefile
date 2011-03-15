require "rake"
require File.join(File.dirname(__FILE__), "lib/boot.rb");

task :truncate do
  Mongomatic.db.collection("Users").drop
end

task :seed do
  
  user = GFI::User.new(
    :email => "somedude@gmail.com", 
    :password => "password", 
    :password_confirmation => "passdword"
  )

  user.insert!
end