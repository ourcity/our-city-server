class Api::V1::EventsController < Api::ApiController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params(:id))
  end

  private

end