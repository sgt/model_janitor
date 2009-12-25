require 'model_janitor'

if Object.const_defined?('ActiveRecord')
  ActiveRecord::Base.send(:include, ModelJanitor::ActiveRecord)
end
