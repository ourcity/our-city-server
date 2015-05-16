class Vote < ActiveRecord::Base
  belongs_to :person
  belongs_to :event_item
  belongs_to :vote_type
end
