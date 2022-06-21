class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_task!

  private

  def load_task
    # TODO Add a check that the task exists
    @task = Task.find(comment_params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end
end
