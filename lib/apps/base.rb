module GFI
  class Base < Sinatra::Base
    
    helpers ::GFI::Helpers
    use Rack::Flash
    enable :sessions
    
  end
end