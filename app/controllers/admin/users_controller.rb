# frozen_string_literal: true

require 'csv'

module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]

    # GET /users or /users.json
    def index
      @users = User.all
    end

    # GET /users/1 or /users/1.json
    def show
      @total_hours = total_hours_for_user(@user)
    end

    # GET /users/1/edit
    def edit; end

    # PATCH/PUT /users/1 or /users/1.json
    def update; end

    # DELETE /users/1 or /users/1.json
    def destroy; end

    def export_participation_data
      @user_hours = {}

      User.all.find_each do |user|
        @user_hours[user] = total_hours_for_user(user)
      end

      respond_to do |format|
        format.csv do
          response.headers['Content-Type'] = 'text/csv'
          response.headers['Content-Disposition'] = 'attachment; filename=participation_data.csv'
          render(template: 'admin/users/participation_data')
        end
      end
    end

    private

    # sums all hours for past event logs
    # uses event logs' hours field rather than event hours
    def total_hours_for_user(user)
      total_hours = 0
      event_logs = EventLog.all.where(user_id: user.id)
      event_logs.each do |event_log|
        if Event.find(event_log.event_id).datetime.past? && event_log.participating
          total_hours += event_log.hours
        end
      end
      total_hours
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:access_level, :first_name, :last_name, :major, :year,
                                   :phone_number, :email
      )
    end
  end
end
