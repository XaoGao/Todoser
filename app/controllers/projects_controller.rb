class ProjectsController < ApplicationController
  include AutoInject["create_project_service", "task_favorite_repository", "projects_repository"]

  before_action :authenticate_user!

  def index
    @search = current_user.member_in_project.ransack(params[:q])
    @projects = @search.result(distinct: true).page(params[:page])
  end

  def new
    @project = Project.new
  end

  def members
    @project = projects_repository.find(params[:id])
    respond_to do |format|
      format.json { render json: { data: MembersSerializer.new(@project.members).serializable_hash.to_json }, status: :ok }
    end
  end

  def create
    @project = current_user.projects.build project_params

    result = create_project_service.call(@project, current_user)
    if result.success?
      redirect_to project_path(@project), notice: result.data
    else
      render :new, alert: result.error_messages
    end
  end

  def edit
    @project = projects_repository.find(params[:id])
  end

  def update
    @project = projects_repository.find(params[:id])
    if @project.update project_params
      redirect_to project_path(@project), notice: t("projects.update.successful", project_name: @project.title)
    else
      flash[:alert] = t("projects.update.error", project_name: @project.title)
      render :edit
    end
  end

  def show
    @project = Project.includes(:tasks).find(params[:id])

    authorize! @project

    @tasks = task_favorite_repository.call(@project, current_user)

    @task = @project.tasks.build
  end

  def archive
    @project = projects_repository.find(params[:id])
    unless @project.archive?
      @project.update(status: :archive)
    end

    render :show
  end

  def destroy
    @project = projects_repository.find(params[:id])
    if @project.disabled
      flash[:success] = "ok"
    else
      flash[:alert] = "bad"
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :short_title, :description)
  end
end
