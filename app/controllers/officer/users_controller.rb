module Officer
    
    class UsersController < ApplicationController
        before_action :set_user, only: %i[ show ]
        
        # GET /users or /users.json
        def index
            @users = User.all
            # Could calc all users hours here? would be easier for now to just do it per user in show
        end
        
        # GET /users/1 or /users/1.json
        def show
            # calc user's hours here
            # loop through event_logs with user_id, and add up hours
            @total_hours = 0
            @event_logs = EventLog.all.where(user_id: @user.id)
            @event_logs.each do |event_log|
                @total_hours += event_log.hours if Event.find(event_log.event_id).date.past?
            end
        end
    end
end

private
# Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
    end