require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_support/test_case'
require 'active_record'
require 'action_view'
require 'factory_girl'
require 'shoulda'

require File.expand_path( File.dirname(__FILE__) + '/../init' )
require 'data/models'

class ActiveSupport::TestCase

  def reset_db!
    ::ActiveRecord::Migration.verbose = false
    ::ActiveRecord::Base.establish_connection( { :adapter => 'sqlite3', :database => ':memory:' } )
    
    load File.join( File.dirname(__FILE__), 'data/schema.rb')
  end
  
  @@bio = 'Lorem <img src="http://lala.com/lala.png"><div>ipsum <b>dolor</b> sit amet</div>, consectetur >adipisicing< elit.'
  
  Factory.define :person do |p|
    p.name 'Lorem >Ipsum <b>Dolor</b>'
    p.bio @@bio.clone
    p.relaxed_bio @@bio.clone
  end
  
end
