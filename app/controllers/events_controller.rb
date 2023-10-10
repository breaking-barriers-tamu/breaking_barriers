# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, :update_event_status, only: %i[show]

  # GET /events or /events.json
  def index
    @events = Event.all
    for event in @events
      event.update_attribute(:event_enabled, event.is_active?)
    end
  end

  # GET /events/1 or /events/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :date, :time, :location, :description, :duration)
  end

end
