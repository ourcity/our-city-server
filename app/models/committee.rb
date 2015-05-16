class Committee < ActiveRecord::Base
  belongs_to :body
  has_many :committee_members
end
