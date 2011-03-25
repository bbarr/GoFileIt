module GFI
  module Helpers
    # Render content that was stored in the content array with the given key
    def content(key)
      @content && @content[key]
    end

    # Define content for a particular key to render later at the appropriate
    # point, Simulates Rails's content_for helper
    #
    # @example Define content block area in layout named :js
    #   = content :js
    #
    # @example Making use of a content block named :js
    #   - content_for :js do
    #     :javascript
    #       (function() {
    #         alert("Hello World");
    #       }();
    #
    # @see http://forrst.com/posts/content_for_in_Sinatra_for_HAML-i8x
    def content_for(key, &block)
      @content ||= {}
      @content[key] = capture_haml(&block)
    end
  end
end

module Mote
  class Document
    
    def self.find_by_id id
      self.find_one( { '_id' => id } )
    end
    
    def get_id subject
      return subject if subject.is_a? BSON::ObjectId
      return subject['_id'] unless subject['_id'].nil?
      # exception
    end
    
  end
end