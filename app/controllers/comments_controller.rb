class CommentsController < ApplicationController
  def create
    @announcement = Announcement.find(params[:announcement_id])
    @comment = @announcement.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      Turbo::StreamsChannel.broadcast_to(
        @announcement,
        turbo_stream.append(
          "comments",
          partial: "comments/comment",
          locals: { comment: @comment }
        )
      )
      redirect_to @announcement, notice: 'Comment was successfully created.'
    else
      # Handle validation errors
      # You can render the same 'show' template with errors if needed
      redirect_to @announcement, alert: 'Cannot add empty comment.'
    end
  end
    
  private
    
  def comment_params
    params.require(:comment).permit(:content)
  end
end
