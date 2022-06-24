class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable!

  def create
    @comment = Comment.new(commentable: @commentable, user: current_user)
    # already exist
    if @comment.save
      return head :bad_request
    else
      return head :bad_request
    end
  end

  private

  def load_commentable!
    # TODO Add a check that the task exists
    @commentable = Task.find(comment_params[:commentable_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end
end
