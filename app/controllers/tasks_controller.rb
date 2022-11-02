class TasksController < ApplicationController
  include AutoInject["task_move_service", "tasks_repository"]

  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @tasks = tasks_repository.where(project_id: params[:project_id])
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
      redirect_to projects_path, alert: t(".error")
    end
  end

  def edit
    @task = tasks_repository.find(params[:id])

    authorize! @task

    @project = Project.find(params[:project_id])
  end

  def update
    @task = tasks_repository.find(params[:id])

    authorize! @task

    @project = Project.find(params[:project_id])
    executor = User.find_by(id: task_params[:executor])

    if @task.update task_params.merge(executor: executor)
      redirect_to project_path @project
    else
      redirect_to projects_path, alert: t(".error")
    end
  end

  def destroy
    @task = tasks_repository.find(params[:id])

    authorize! @task

    @project = Project.find(params[:project_id])

    if @task.disabled
      flash[:success] = "ok"
    else
      flash[:alert] = "bad"
    end
    redirect_to project_path @project
  end

  def show
    @task = tasks_repository.find(params[:id])

    authorize! @task

    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.json { render json: { data: render_task(@task) }, status: :ok }
      format.html { render :show }
    end
  end

  def move
    @task = tasks_repository.find(params[:id])

    authorize! @task

    result = task_move_service.call(@task, params[:status], params[:position], task_move_params)
    if result.success?
      head :ok
    else
      redirect_to root_path, alert: result.error_messages
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :project_id, :status, :executor, :priority)
  end

  def task_move_params
    params.permit(:id, :project_id, :status, :position)
  end

  def render_task(task)
    ApplicationController.render(partial: 'tasks/task', locals: { task: task })
  end
end
