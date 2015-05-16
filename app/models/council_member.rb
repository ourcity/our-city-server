class CouncilMember < ActiveRecord::Base
  belongs_to :person
  has_many :committee_members
end
