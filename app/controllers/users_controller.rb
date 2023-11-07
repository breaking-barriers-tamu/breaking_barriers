# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    calculate_total_hours
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    calculate_total_hours
    @upcoming_events = []
    @past_events = []

    #pull out all future events i have signed up for
    #and past events for which i received credit
    @event_logs.each do |event_log|
      event = Event.find(event_log.event_id)
      if event.datetime > DateTime.now
        @upcoming_events << event
      else
        if(event_log.participating == true)
          @past_events << event
        end
      end
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "Profile updated successfully!"
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end


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
  def set_user
    # users should not be able to do anything with other users
    @user = @current_user
  end

  def user_params
    params.require(:user).permit(:access_level, :first_name, :last_name, :year,
                                 :phone_number, :email
    )
  end

  def calculate_total_hours
    # calc user's hours here
    # loop through event_logs with user_id, and add up hours
    # code taken from officer view
    # this works under assumption that users cannot view other user's data
    @total_hours = 0
    @event_logs = EventLog.where(user_id: @user.id)
    @event_logs.each do |event_log|
      if Event.find(event_log.event_id).datetime.past? && event_log.participating
        @total_hours += event_log.hours
      end
    end
  end
end