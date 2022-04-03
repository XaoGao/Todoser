class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.include(:project).where(project_id: params[:project_id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    if @task.save task_params
      redirect_to project_task_path @task
    else
      redirect_to projects_path, alert: "error"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update task_params
      redirect_to project_task_path @task
    else
      redirect_to projects_path, alert: "error"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def delete
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :describle, :project_id)
  end
end
