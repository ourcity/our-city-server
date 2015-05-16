class CouncilMemberSerializer < ActiveModel::Serializer
  attributes :id, :ward, :first_name, :last_name, :ward_url, :image_url, :email, :phone, :neighborhoods, :person_id
end
