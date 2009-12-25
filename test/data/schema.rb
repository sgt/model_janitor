ActiveRecord::Schema.define do

  create_table :people, :force=>true do |t|
    t.string :name
    t.text :bio
    t.text :relaxed_bio
  end

end
