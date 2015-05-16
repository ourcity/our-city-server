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

    response[:events].each do |x|
      event = Event.where(id: x['EventId']).first_or_initialize
      event.body_id = x['BodyId']
      event.date = x['EventDate']
      event.time = x['EventTime']
      event.agenda_status = x['EventAgendaStatusName']
      event.minute_status = x['EventMinuteStatusName']
      event.location = x['EventLocation']
      event.save!

      puts "Updated info for event #{event.id}"
    end
  end

  desc "load event items from legistar API"
  task event_items: [:environment] do
    response = LegistarService.event_items

    response[:event_items].each do |x|
      event_item = EventItem.where(id: x['EventId']).first_or_initialize
      event_item.body_id = x['BodyId']
      event_item.date = x['EventDate']
      event_item.time = x['EventTime']
      event_item.agenda_status = x['EventAgendaStatusName']
      event_item.minute_status = x['EventMinuteStatusName']
      event_item.location = x['EventLocation']
      event_item.save!

      puts "Updated info for event #{event_item.id}"
    end
  end

  desc "load actions from legistar API"
  task actions: [:environment] do
    response = LegistarService.actions

    response[:actions].each do |x|
      matter_status = MatterStatus.where(id: x['MatterStatusId']).first_or_initialize
      matter_status.name = x['ActionName']
      matter_status.active_flag = x['ActionActiveFlag']
      matter_status.save!

      puts "Updated info for action #{action.name}"
    end
  end

  desc "load matter_statuses from legistar API"
  task matter_statuses: [:environment] do
    response = LegistarService.matter_statuses

    response[:matter_statuses].each do |x|
      matter_status = MatterStatus.where(id: x['MatterStatusId']).first_or_initialize
      matter_status.name = x['MatterStatusName']
      matter_status.used_flag = x['MatterStatusUsedFlag']
      matter_status.active_flag = x['MatterStatusActiveFlag']
      matter_status.description = x['MatterStatusDescription']
      matter_status.save!

      puts "Updated info for body #{body.name}"
    end
  end


end