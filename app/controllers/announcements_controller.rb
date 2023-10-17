# frozen_string_literal: true

class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :ensure_admin, only: %i[new create edit update destroy]

  def index
    # Reverse order so that most recent announcements are first
    @announcements = Announcement.all.reverse
  end

  def show
    @announcement = Announcement.find(params[:id])
    @comments = @announcement.comments

    # Check if the current user is a member, and if so, filter out archived comments
    @comments = @comments.where(archived: false) if current_user.member?
  end

  def new
    @announcement = Announcement.new
  end

  def edit; end

  def create
    # TODO: build announcement baed on current user and current time
    @announcement = current_user.announcements.build(announcement_params)
    @announcement.timestamp = Time.current

    respond_to do |format|
      if @announcement.save
        format.html do
          redirect_to(announcement_url(@announcement),
                      notice: 'Announcement was successfully created.'
                     )
        end
        format.json { render(:show, status: :created, location: @announcement) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @announcement.errors, status: :unprocessable_entity) }
      end
    end
  end

  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html do
          redirect_to(announcement_url(@announcement),
                      notice: 'Announcement was successfully updated.'
                     )
        end
        format.json { render(:show, status: :ok, location: @announcement) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @announcement.errors, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    @announcement.destroy!

    respond_to do |format|
      format.html do
        redirect_to(announcements_url, notice: 'Announcement was successfully destroyed.')
      end
      format.json { head(:no_content) }
    end
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def announcement_params
    params.require(:announcement).permit(:title, :body)
  end

  def ensure_admin
    unless current_user&.admin?
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to(root_path)
    end
  end
end
