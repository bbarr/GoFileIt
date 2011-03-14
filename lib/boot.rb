require "sinatra/base"
require "shotgun"
require "mongomatic"
require "rack-flash"
require "warden"
require "haml"
require "json"
require "rspec"

# require base app first
require File.join(File.dirname(__FILE__), "./apps/base.rb")

# now require all the other apps
Dir.glob(File.join(File.dirname(__FILE__), "./apps/*.rb")) { |file| require file }

# now require all the other models
Dir.glob(File.join(File.dirname(__FILE__), "./models/*.rb")) { |file| require file }

# setup mongomatic with mongoDB connection
Mongomatic.db = Mongo::Connection.new.db("go_for_it_#{Sinatra::Application.environment}")