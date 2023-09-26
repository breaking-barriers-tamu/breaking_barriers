# frozen_string_literal: true

class Admin::EventLogsController < ApplicationController
  # updating participation
  def update_participation
    @event_log = EventLog.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def event_log_params
    params.require(:event_log).permit(:hourlog_id, :user_id, :event_id, :hours, :participating)
  end
end
