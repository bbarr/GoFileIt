require "sinatra/base"
require "shotgun"
require "rack-flash"
require "warden"
require "haml"
require "json"

# require base app first
require File.join(File.dirname(__FILE__), "./apps/base.rb")

# now require all the other apps
Dir.glob(File.join(File.dirname(__FILE__), "./apps/*.rb")) { |file| require file }

# require all models
Dir.glob(File.join(File.dirname(__FILE__), "./models/*.rb")) { |file| require file }