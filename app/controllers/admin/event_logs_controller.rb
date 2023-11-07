# frozen_string_literal: true

class Admin::EventLogsController < ApplicationController
  def index
    @event_logs = EventLog.all
  end

  def confirm_participation
    # safe navigation: continue if event_log_attributes present

    event_log = EventLog.find(params[:id])
    event_log.update!(confirmed: true)

    if params[:participating] == 'true'
      event_log.update!(participating: true)
      EventConfirmationMailer.with(user: event_log.user,
                                   event: event_log.event
                                  ).confirmation_email.deliver_later
      redirect_to(admin_event_path(event_log.event),
                  notice: "Successfully confirmed #{event_log.user.first_name} #{event_log.user.last_name} for this event!"
                 )
    else
      EventConfirmationDenyMailer.with(user: event_log.user,
                                       event: event_log.event
                                      ).confirmation_email.deliver_later
      redirect_to(admin_event_path(event_log.event),
                  notice: "Successfully denied #{event_log.user.first_name} #{event_log.user.last_name} for this event!"
                 )
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def event_log_params
    params.require(:event_log).permit(:id, :hourlog_id, :user_id, :event_id, :hours, :participating)
  end
end
