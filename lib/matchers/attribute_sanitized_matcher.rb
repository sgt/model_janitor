module ModelJanitor
  module Shoulda
    module Matchers
      
      def is_attribute_sanitized(attr_name, mode)
        AttributeSanitizedMatcher.new(attr_name, mode)
      end
      
      class AttributeSanitizedMatcher
        def initialize(attr_name, mode)
          @attr_name = attr_name
          @mode = mode
        end
        
        def matches?(subject)
          @subject = subject.new
          @subject[@attr_name] = "<b>Lorem</b> <div>ipsum</div>"
          @subject.save_with_validation(false)
          if strip_tags_mode?
            @subject[@attr_name] == "Lorem ipsum"
          else
            @subject[@attr_name] == "<b>Lorem</b> ipsum"
          end
        end
        
        def failure_message
          "Should " + mode_message
        end
        
        def negative_failure_message
          "Should not " + mode_message
        end
        
        def description
          mode_message
        end
        
        private
        
        def strip_tags_mode?
          @mode == :strip_tags
        end
        
        def mode_message
          if strip_tags_mode?
            "strip tags from the attribute `#{@attr_name}'"
          else
            "sanitize the attribute `#{@attr_name}'"
          end
        end
      end

    end
  end
end
