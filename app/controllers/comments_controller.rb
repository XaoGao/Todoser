class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable!

  def create
    @comment = Comment.new(commentable: @commentable, user: current_user)
    if @comment.save
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  def update
    if @commentable.update(commentable: @commentable, user: current_user)
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  private

  def load_commentable!
    @commentable = Task.find(comment_params[:commentable_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end
end
