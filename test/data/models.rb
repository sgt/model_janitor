class Person < ActiveRecord:: Base
  strips_tags :name
  sanitizes :bio
  sanitizes :relaxed_bio, :mode => Sanitize::Config::RELAXED
end
