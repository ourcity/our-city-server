require 'httparty'

class LegistarService

  def self.bodies
    response = HTTParty.get('http://webapi.legistar.com/v1/minneapolismn/bodies')

    result = {status: :error}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:bodies] = response
    end
    result
  end

  def self.body_types
    response = HTTParty.get('http://webapi.legistar.com/v1/minneapolismn/bodytypes')

    result = {status: :error}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:body_types] = response
    end
    result
  end

  def self.matter_statuses
    response = HTTParty.get('http://webapi.legistar.com/v1/minneapolismn/matterstatuses')

    result = {status: :error}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:matter_statuses] = response
    end
    result
  end

  def self.events
    response = HTTParty.get('http://webapi.legistar.com/v1/minneapolismn/events')

    result = {status: :error}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:events] = response
    end
    result
  end

  def self.people
    response = HTTParty.get('http://webapi.legistar.com/v1/minneapolismn/persons')

    result = {status: :error}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:people] = response
    end
    result
  end

  def self.actions
    response = HTTParty.get("http://webapi.legistar.com/v1/minneapolismn/actions")

    result = {status: :error}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:people] = response
    end
    result
  end

  def self.event_items(event_id)
    response = HTTParty.get("http://webapi.legistar.com/v1/minneapolismn/events/#{event_id}/event_items?AgendaNote=1&MinutesNote=1")

    result = {status: :error}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:people] = response
    end
    result
  end

end

