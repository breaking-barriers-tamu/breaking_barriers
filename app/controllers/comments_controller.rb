class CommentsController < ApplicationController
  before_action :set_announcement
  before_action :set_comment, only: [:destroy]

  # CREATE
  def create
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to @announcement, notice: 'Comment was successfully created.'
    else
      # Handle validation errors
      # You can render the same 'show' template with errors if needed
      redirect_to @announcement, alert: 'Comment could not be saved. Cannot add an empty comment.'
    end
  end

  # DESTROY
  def destroy
    @comment = Comment.find(params[:id])
    announcement = @comment.announcement
  
    if @comment.user == current_user
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to announcement, notice: "Comment was successfully deleted." }
        format.json { head :no_content }
      end
    else
      redirect_to announcement, alert: "You are not authorized to delete this comment."
    end
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:announcement_id])
  end

  def set_comment
    @comment = @announcement.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
