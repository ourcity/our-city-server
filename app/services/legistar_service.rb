require 'httparty'
require 'nokogiri'

class LegistarService

  def self.bodies
    response = HTTParty.get('http://webapi.legistar.com/v1/minneapolismn/bodies')

    result = {status: :error, items: ""}
    if response.code.to_s == "200"
      result[:status] = :success
      result[:bodies] = response
    end
    result
  end

