# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  # GET /events or /events.json
  def index
    @start_date = params[:start_date] ? Date.parse(params[:start_date]) : Date.today.beginning_of_month
    @calendar_events = Event.where(datetime: @start_date.beginning_of_month..@start_date.end_of_month)
  end


  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])

    # may not exist (only present if current user signed up for event)
    @event_log = EventLog.where(user: current_user, event: @event)
  end

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
