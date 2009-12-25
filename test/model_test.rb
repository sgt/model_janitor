require 'test_helper'
require 'shoulda_macros/model_janitor'

class PersonTest < ActiveSupport::TestCase
  
  context "model" do
    setup do
      reset_db!
      Factory(:person)
    end
    
    #subject { Factory(:person) }
    
    should_strip_tags :name
    should_sanitize :bio
    should_sanitize :relaxed_bio
  end
end
