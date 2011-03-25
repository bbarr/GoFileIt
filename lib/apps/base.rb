module GFI
  class Base < Sinatra::Base
    
    helpers ::GFI::Helpers
    use Rack::Flash
    enable :sessions
    
    def current_user
      @current_user ||= User.find_one
    end
    
  end
end