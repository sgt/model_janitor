require 'matchers/attribute_sanitized_matcher'
require 'action_controller'

module ModelJanitor
  module Shoulda
    include Matchers
 
    def should_sanitize(*args)
      match_class(args, :sanitize)
    end
  
    def should_strip_tags(*args)
      match_class(args, :strip_tags)
    end

    private

    def match_class(args, mode)
      klass = self.name.gsub(/Test$/, '').constantize
      args.each do |a|
        matcher = is_attribute_sanitized(a, mode)
        should matcher.description do
          assert_accepts(matcher, klass)
        end
      end
    end
  end  
end

class ActionController::Integration::Session  #:nodoc:
  include ModelJanitor::Shoulda
end

class Factory
  include ModelJanitor::Shoulda  #:nodoc:
end

class Test::Unit::TestCase #:nodoc:
 extend ModelJanitor::Shoulda
end
