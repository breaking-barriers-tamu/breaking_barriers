class Admin::EventLogsController < ApplicationController
    # updating participation
    def update_participation
        @event_log = EventLog.find(params[:id])
    
        if @event_log.update(event_log_params)
        # Handle successful update, e.g., redirect or show a success message
        else
        # Handle errors, e.g., re-render the form with error messages
        end
    end

    private
    # Only allow a list of trusted parameters through.
    def event_log_params
      params.require(:event_log).permit(:hourlog_id, :user_id, :event_id, :hours, :participating)
    end
end
