require 'sanitize'

module ModelJanitor # :nodoc:
  module ActiveRecord # :nodoc:
    
    def self.included(base)
      base.extend(ClassMethods)
    end
  
    module ClassMethods # :nodoc:
    
      def sanitizes(*attr_names)
        attr_names.flatten!
        options = attr_names.extract_options!
        mode = options.has_key?(:mode) ? options[:mode] : Sanitize::Config::BASIC
        attr_names.each do |a|
          before_save do |record|
            Sanitize.clean!(record.send(a), mode) unless record.send(a).nil?
          end
        end
      end
    
      def strips_tags(*attr_names)
        sanitizes attr_names, :mode=>{}
      end
    
    end
  
  end
end
