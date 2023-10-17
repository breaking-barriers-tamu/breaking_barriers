# frozen_string_literal: true

class Admin::EventLogsController < ApplicationController
  def index
    @event_logs = EventLog.all
  end

  private

  # Only allow a list of trusted parameters through.
  def event_log_params
    params.require(:event_log).permit(:id, :hourlog_id, :user_id, :event_id, :hours, :participating)
  end
end
