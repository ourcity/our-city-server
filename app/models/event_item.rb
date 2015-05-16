class EventItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :action
  belongs_to :matter
  has_many :votes
  has_many :roll_calls
end
