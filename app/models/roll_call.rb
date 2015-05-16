class RollCall < ActiveRecord::Base
  belongs_to :person
  belongs_to :event_item
end
