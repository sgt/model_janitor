require 'test_helper'

class ModelJanitorTest < ActiveSupport::TestCase
  context "a model" do
    setup do
      reset_db!
      Factory(:person)
      @person = Person.first
    end
    
    should "be created" do
      assert_not_nil @person
    end
    
    should "strip tags from :name" do
      assert_equal "Lorem &gt;Ipsum Dolor", @person.name
    end
    
    should "sanitize the :bio" do
      assert_equal 'Lorem ipsum <b>dolor</b> sit amet, consectetur &gt;adipisicing', @person.bio
    end
    
    should "sanitize the :relaxed_bio in a relaxed way" do
      assert_equal 'Lorem <img src="http://lala.com/lala.png">ipsum <b>dolor</b> sit amet, consectetur &gt;adipisicing', @person.relaxed_bio
    end
  end
end
