# frozen_string_literal: true

class EventLogsController < ApplicationController
  before_action :set_event_log, only: %i[show delete]

  # GET /event_logs/1 or /event_logs/1.json
  def show; end

  # GET /event_logs/new
  def new
    @event_log = EventLog.new(event_log_params)

    respond_to do |format|
      if @event_log.save
        format.html do
          redirect_to(event_url(@event_log.event),
                      notice: 'You are signed up to volunteer for this event!'
                     )
        end
        format.json { render(:show, status: :created, location: @event_log) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event_log.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /event_logs/1 or /event_logs/1.json

  def delete
    @event_log.destroy!

    respond_to do |format|
      format.html do
        redirect_to(event_url(@event_log.event),
                    notice: 'Successfully removed your request to volunteer for this event.'
                   )
      end
      format.json { head(:no_content) }
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
