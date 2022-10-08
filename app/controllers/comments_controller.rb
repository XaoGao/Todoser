class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable!

  def create
    authorize! @commentable, with: CommentPolicy

    @comment = Comment.new(commentable: @commentable, user: current_user, message: comment_params[:message])

    if @comment.save
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  def update
    @comment = Comment.find(params[:id])

    authorize! @comment, with: CommentPolicy

    if @comment.update(comment_params)
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    authorize! @comment, with: CommentPolicy

    @comment.update(delete_at: DateTime.now)

    redirect_to root_path
  end

  private

  def load_commentable!
    @commentable = Task.find(comment_params[:commentable_id])
  end

  def comment_params
    params.require(:comment).permit(:message, :commentable_type, :commentable_id)
  end
end
