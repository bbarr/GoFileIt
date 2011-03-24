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

module GFI
  module Helpers
    module Model
      
      # def self.included(base)
      #   base.extend(ClassMethods)
      # end
      # 
      def get_id subject
        return subject if subject.is_a? BSON::ObjectId
        return subject['_id'] unless subject['_id'].nil?
        # exception
      end
      # 
      # def find_by_id subject
      #   id = get_id subject
      #   self.class.find( { '_id' => id } )
      # end
      # 
      # def method_missing(m, *args, &block)
      #   id_list = m.to_sym
      #   if self.class.id_lists.include? id_list
      #     fetch_id_list id_list
      #   end
      # end
      # 
      # def fetch_id_list id_list
      #   resource_name = id_list.sub(/_id$/, '').capitalize
      #   self[id_list].map do |element|
      #     return element if element.is_a? BSON::ObjectId
      #     element.each do |k, v|
      #       if k.grep(/_id$/)
      #         
      #       end
      #     end
      #   end
      # end
      #     
      # module ClassMethods
      #   
      #   def id_lists
      #     @id_lists ||= []
      #   end
      #   
      #   def id_list key
      #     self.id_lists.push key
      #   end
      #   
      # end

    end
  end
end