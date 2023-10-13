# frozen_string_literal: true

class EventLogsController < ApplicationController
  before_action :set_event_log, only: %i[show delete]

  # GET /event_logs/1 or /event_logs/1.json
  def show; end

  # GET /event_logs/new
  def new
    @event_log = EventLog.new(event_log_params)
    if Event.where(id: @event_log.event_id).blank? 
      redirect_to(events_path, notice: 'You are already signed up for this event.') and return
    end
    @event_log.user_id = current_user.id
    @event_log.hours = @event_log.event.duration

    if EventLog.where(user_id: current_user, event_id: @event_log.event_id).blank? && @event_log.save
      redirect_to(event_path(@event_log.event_id), notice: 'You are signed up for this event!')
    else
      redirect_to(events_path, notice: 'Please try again later.')
    end
  end

  # DELETE /event_logs/1 or /event_logs/1.json

  def delete
    @event_log.destroy!
    if @event_log.user_id != current_user.id
      redirect_to(events_path, notice: 'Please try again later.')
    else
      respond_to do |format|
        format.html { redirect_to(event_url(@event_log.event), notice: 'Successfully removed you from this event.') }
        format.json { head(:no_content) }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_log
    @event_log = EventLog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_log_params
    params.permit(:event_log, :id, :hourlog_id, :user_id, :event_id, :hours, :participating)
  end
end
