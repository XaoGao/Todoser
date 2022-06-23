class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_task!

  def create
    @comment = @task.find_by(user: current_user)
    # already exist
    if @comment.present? && @comment.delete_at.nil?
      return head :bad_request
    end

    # enable old favorite
    if @comment.present? && !@comment.delete_at.nil?
      @comment.update(delete_at: nil)
      return head :ok
    end

    @comment = Comment.new(commentable: @commentable, user: current_user)
    if @comment.save
      head :ok
    else
      head :bad_request
    end
  end

  private

  def load_task!
    # TODO Add a check that the task exists
    @task = Task.find(comment_params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable)
  end
end
