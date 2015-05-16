namespace :council_data do
  desc "add Committees and Council Members to DB"
  task all: [:environment] do
    dir = "data"
    committees_file = Rails.root.join(dir, "committees.csv")

    CSV.parse(File.read(committees_file), headers: true) do |row|
      committee = Committee.where(id: row['id']).first_or_initialize
      committee.name = row['name']
      committee.comm_type = row['type']
      committee.info_url = row['info_url']
      committee.code = row['code']
      committee.body_id = row['body_id']
      committee.save!

      puts "Updated info for #{committee.id}"
    end

    council_member_file = Rails.root.join(dir, "council_members.csv")

    CSV.parse(File.read(council_member_file), headers: true) do |row|
      council_member = CouncilMember.where(id: row['id']).first_or_initialize
      council_member.ward       = row['ward']
      council_member.first_name = row['first_name']
      council_member.last_name  = row['last_name']
      council_member.ward_url  = row['ward_url']
      council_member.image_url  = row['image_url']
      council_member.email  = row['email']
      council_member.phone  = row['phone']
      council_member.neighborhoods  = row['neighborhoods']
      council_member.person_id  = row['person_id']
      council_member.save!

      puts "Updated info for #{council_member.id}"
    end

    CSV.parse(File.read(Rails.root.join(dir, "committee_members.csv")), headers: true) do |row|
      committee_member = CommitteeMember.where(id: row['id']).first_or_initialize
      committee_member.council_member_id = row['council_member_id']
      committee_member.committee_id = row['committee_id']
      committee_member.chair  = row['chair']
      committee_member.vice_chair = row['vice_chair']
      committee_member.vice_chair = row['vice_chair']
      committee_member.save!

      puts "Updated info for #{committee_member.id}"
    end
  end
end