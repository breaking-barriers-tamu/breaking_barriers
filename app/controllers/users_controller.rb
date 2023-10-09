# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show 
    # calc user's hours here
    # loop through event_logs with user_id, and add up hours
    # code taken from officer view, this works under assumption that users cannot view other user's data
    @total_hours = 0
    @event_logs = EventLog.all.where(user_id: @user.id)
    @event_logs.each do |event_log|
      @total_hours += event_log.hours if Event.find(event_log.event_id).date.past?
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to(user_url(@user), notice: 'User was successfully created.') }
        format.json { render(:show, status: :created, location: @user) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
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
