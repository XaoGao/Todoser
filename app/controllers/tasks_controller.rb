class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.where(project_id: params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params.merge(author: current_user))

    if @task.save
      redirect_to project_path @project
    else
      redirect_to projects_path, alert: "error"
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    if @task.update task_params
      redirect_to project_path @project
    else
      redirect_to projects_path, alert: "error"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    if @task.disabled
      flash[:success] = "ok"
    else
      flash[:alert] = "bad"
    end
    redirect_to project_path @project
  end

  private

  def task_params
    params.require(:task).permit(:title, :describle, :project_id)
  end
end
