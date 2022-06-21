class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_task!
  before_action :authenticate_user!

  private

  def load_task
    @task = Task.find_by!(id: comment_params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end
end
