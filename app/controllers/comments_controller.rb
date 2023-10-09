class CommentsController < ApplicationController
  def create
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to @announcement, notice: 'Comment was successfully created.'
    else
      # Handle validation errors
      # You can render the same 'show' template with errors if needed
      redirect_to @announcement, alert: 'Comment could not be saved.'
    end
  end
    
  private
    
  def comment_params
    params.require(:comment).permit(:content)
  end
end
