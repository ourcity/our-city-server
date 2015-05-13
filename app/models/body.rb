class Body < ActiveRecord::Base
  belongs_to :body_type
  belongs_to :person
  has_many :events
end
