# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]

    # GET /users or /users.json
    def index
      @users = User.all
    end

    # GET /users/1 or /users/1.json
    def show
      @total_hours = 0
      @event_logs = EventLog.all.where(user_id: @user.id)
      @event_logs.each do |event_log|
        @total_hours += event_log.hours if Event.find(event_log.event_id).datetime.past?
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:access_level, :first_name, :last_name, :major, :year, :phone_number, :email)
    end
  end
end
