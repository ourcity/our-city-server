class Matter < ActiveRecord::Base
  belongs_to :matter_type
  belongs_to :matter_status
  belongs_to :body
end
