require 'httparty'
  
namespace :legistar_data do 
  desc "load people from legistar API"
  task people: [:environment] do
    response = LegistarService.people

    response[:people].each do |x|
      person = Person.where(id: x['PersonId']).first_or_initialize
      person.first_name = x['PersonFirstName']
      person.last_name = x['PersonLastName']
      person.full_name = x['PersonFullName']
      person.active_flag = x['PersonActiveFlag']
      person.used_sponsor_flag = x['PersonUsedSponsorFlag']
      person.save!

      puts "Updated info for person #{person.full_name}"
    end
  end

  desc "load body types from legistar API"
  task body_types: [:environment] do
    response = LegistarService.body_types

    response[:body_types].each do |x|
      body_type = BodyType.where(id: x['BodyTypeId']).first_or_initialize
      body_type.name = x['BodyTypeName']
      body_type.save!

      puts "Updated info for body_type #{body_type.name}"
    end
  end

  desc "load bodies from legistar API"
  task bodies: [:environment] do
    response = LegistarService.bodies

    response[:bodies].each do |x|
      body = Body.where(id: x["BodyId"]).first_or_initialize
      body.name = x["BodyName"]
      body.body_type_id = x["BodyTypeId"]
      body.meet_flag = x["BodyMeetFlag"]
      body.active_flag = x["BodyActiveFlag"]
      body.description = x["BodyDescription"]
      body.person_id = x["BodyContactNameId"]
      body.number_of_members = x["BodyNumberOfMembers"].to_i
      body.person_name = x["BodyContactName"]
      body.save!

      puts "Updated info for body #{body.name}"
    end
  end

  desc "load events from legistar API"
  task events: [:environment] do
    response = LegistarService.events

    response[:events].each do |event|
      event = Event.where(id: event['EventId']).first_or_initialize
      event.body_id = event['BodyId']
      event.date = event['EventDate']
      event.time = event['EventTime']
      event.agenda_status = event['EventAgendaStatusName']
      event.minute_status = event['EventMinuteStatusName']
      event.location = event['EventLocation']
      event.save!

      puts "Updated info for event #{event.id}"
    end
  end

  desc "load matter_statuses from legistar API"
  task matter_statuses: [:environment] do
    response = LegistarService.matter_statuses

    response[:matter_statuses].each do |matter_status|
      matter_status = MatterStatus.where(id: matter_status['MatterStatusId']).first_or_initialize
      matter_status.name = matter_status['MatterStatusName']
      matter_status.used_flag = matter_status['MatterStatusUsedFlag']
      matter_status.active_flag = matter_status['MatterStatusActiveFlag']
      matter_status.description = matter_status['MatterStatusDescription']
      matter_status.save!

      puts "Updated info for body #{body.name}"
    end
  end


end