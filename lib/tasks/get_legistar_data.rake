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
      event.body_id = x['EventBodyId']
      event.date = x['EventDate']
      event.time = x['EventTime']
      event.agenda_status = x['EventAgendaStatusName']
      event.minute_status = x['EventMinuteStatusName']
      event.location = x['EventLocation']
      event.save!

      puts "Updated info for event #{event.id}"
    end
  end

  desc "load matter_types from legistar API"
  task matter_types: [:environment] do
    response = LegistarService.matter_types

    response[:matter_types].each do |x|
      matter_type = MatterType.where(id: x['MatterTypeId']).first_or_initialize
      matter_type.name = x['MatterTypeName']
      matter_type.sort = x['MatterTypeSort']
      matter_type.used_flag = x['MatterTypeUsedFlag']
      matter_type.active_flag = x['MatterTypeActiveFlag']
      matter_type.description = x['MatterTypeDescription']
      matter_type.save!

      puts "Updated info for matter type #{matter_type.name}"
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

      puts "Updated info for matter_status #{matter_status.name}"
    end
  end

  desc "load matters from legistar API"
  task matters: [:environment] do
    response = LegistarService.matters

    response[:matters].each do |x|
      matter = Matter.where(id: x['MatterId']).first_or_initialize
      matter.body_id = x['MatterBodyId']
      matter.file = x['MatterFile']
      matter.name = x['MatterName']
      matter.title = x['MatterTitle']
      matter.matter_type_id = x['MatterTypeId']
      matter.matter_status_id = x['MatterStatusId']
      matter.intro_date = x['MatterIntroDate']
      matter.agenda_date = x['MatterAgendaDate']
      matter.passed_date = x['MatterPassedDate']
      matter.enactment_date = x['MatterEnactmentDate']
      matter.enactment_number = x['MatterEnactmentNumber']
      matter.requester = x['MatterRequester']
      matter.notes = x['MatterNotes']
      matter.save!

      puts "Updated info for matter #{matter.title}"
    end
  end

  desc "load event items from legistar API"
  task event_items: [:environment] do
    Event.all.each do |event|

      response = LegistarService.event_items(event.id)
      if response[:status] == "200"
        response[:event_items].each do |x|
          event_item = EventItem.where(id: x['EventId']).first_or_initialize
          event_item.event_id = x['EventItemEventId']
          event_item.date = x['EventDate']
          event_item.time = x['EventTime']
          event_item.agenda_sequence = x['EventItemAgendaSequence']
          event_item.minute_sequence = x['EventItemMinuteSequence']
          event_item.agenda_note = x['EventItemAgendaNote']
          event_item.minute_note = x['EventItemMinuteNote']
          event_item.action_id = x['EventItemActionId']
          event_item.passed_flag = x['EventItemPassedFlag']
          event_item.passed_flag_name = x['EventItemPassedFlagName']
          event_item.roll_call_flag = x['EventItemRollCallFlag']
          event_item.action_id = x['EventItemActionId']
          event_item.title = x['EventItemTitle']
          event_item.tally = x['EventItemTally']
          event_item.consent = x['EventItemConsent']
          event_item.mover_id = x['EventItemMoverId']
          event_item.seconder_id = x['EventItemSeconderId']
          event_item.seconder_id = x['EventItemMatterId']
          event_item.matter_type = x['EventItemMatterType']
          event_item.matter_status = x['EventItemMatterStatus']
          event_item.save!

          puts "Updated info for event #{event_item.title}"
        end
      else
        puts "bad request"
      end
    end
  end

  desc "load actions from legistar API"
  task actions: [:environment] do
    response = LegistarService.actions

    response[:actions].each do |x|
      action = Action.where(id: x['ActionId']).first_or_initialize
      action.name = x['ActionName']
      action.active_flag = x['ActionActiveFlag']
      action.save!

      puts "Updated info for action #{action.name}"
    end
  end

  desc "load vote types from legistar API"
  task vote_types: [:environment] do
    response = LegistarService.vote_types

    response[:vote_types].each do |x|
      vote_type = VoteType.where(id: x['VoteTypeId']).first_or_initialize
      vote_type.name = x['VoteTypeName']
      vote_type.used_for = x['VoteTypeUsedFor']
      vote_type.result = x['VoteTypeResult']
      vote_type.sort = x['VoteTypeSort']
      vote_type.save!

      puts "Updated info for vote_type #{vote_type.name}"
    end
  end

  desc "load vote types from legistar API"
  task vote_types: [:environment] do
    response = LegistarService.vote_types

    response[:votes].each do |x|
      vote = VoteType.where(id: x['VoteId']).first_or_initialize
      vote.vote_type_id = x['VoteTypeId']
      vote.name = x['VoteName']
      vote.used_for = x['VoteUsedFor']
      vote.result = x['VoteResult']
      vote.sort = x['VoteSort']
      vote.save!

      puts "Updated info for vote #{vote.name}"
    end
  end

  desc "load roll calls from legistar API"
  task roll_calls: [:environment] do
    EventItem.all.each do |event_item|

      response = LegistarService.roll_calls(event_item.id)
      if response[:status] == "200"
        response[:roll_calls].each do |x|
          # roll_call = EventItem.where(id: x['EventId']).first_or_initialize
          # roll_call.event_id = x['EventItemEventId']
          # roll_call.date = x['EventDate']
          # roll_call.time = x['EventTime']
          # roll_call.agenda_sequence = x['EventItemAgendaSequence']
          # roll_call.minute_sequence = x['EventItemMinuteSequence']
          # roll_call.agenda_note = x['EventItemAgendaNote']
          # roll_call.minute_note = x['EventItemMinuteNote']
          # roll_call.action_id = x['EventItemActionId']
          # roll_call.passed_flag = x['EventItemPassedFlag']
          # roll_call.passed_flag_name = x['EventItemPassedFlagName']
          # roll_call.roll_call_flag = x['EventItemRollCallFlag']
          # roll_call.save!

          # puts "Updated info for event #{event_item.title}"
        end
      else
        puts "bad request"
      end
    end
  end

end