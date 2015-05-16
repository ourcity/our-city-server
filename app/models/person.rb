class Person < ActiveRecord::Base
  has_many :bodies
  has_many :roll_calls
end
