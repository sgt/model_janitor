require 'model_janitor'
ActiveRecord::Base.send :include, ModelJanitor::ActiveRecord
