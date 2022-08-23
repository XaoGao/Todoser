class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.where(project_id: params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(priority: Task.priorities[:medium])

    authorize! @task
  end

  def create
    @project = Project.find(params[:project_id])
    executor = User.find_by(id: task_params[:executor])
    default_value = { author: current_user, executor: executor, status: Task.statuses[:selected] }
    @task = @project.tasks.build(task_params.merge(default_value))

    authorize! @task

    if @task.save
      redirect_to project_path @project
    else
      redirect_to projects_path, alert: "error"
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    authorize! @task
  end

  def update
    @project = Project.find(params[:project_id])
    executor = User.find_by(id: task_params[:executor])
    @task = Task.find(params[:id])

    authorize! @task

    if @task.update task_params.merge(executor: executor)
      redirect_to project_path @project
    else
      redirect_to projects_path, alert: "error"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    authorize! @task
    if @task.disabled
      flash[:success] = "ok"
    else
      flash[:alert] = "bad"
    end
    redirect_to project_path @project
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    authorize! @task
  end

  def move
    task = Task.find(params[:id])

    tasks_old_column = Task.where("status = ? AND position > ?", Task.statuses[task.status], task.position)
    tasks_new_column = Task.where("status = ? AND position >= ?", Task.statuses[params[:status]], params[:position])

    ActiveRecord::Base.transaction do
      tasks_old_column.each do |t|
        t.update(position: t.position - 1)
      end

      tasks_new_column.each do |t|
        t.update(position: t.position + 1)
      end

      task.update task_move_params
    end

    head :ok
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :project_id, :status, :executor, :priority)
  end

  def task_move_params
    params.permit(:id, :project_id, :status, :position)
  end
end
