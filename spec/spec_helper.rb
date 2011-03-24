require "sinatra/base"
Sinatra::Application.environment = 'test'
require File.join(File.dirname(__FILE__), "../lib/boot.rb")