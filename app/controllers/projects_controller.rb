class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.member_in_project
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build project_params
    if @project.save
      render :show, notice: t("projects.create.successful", project_name: @project.title)
    else
      flash[:alert] = t("projects.create.error", project_name: @project.title)
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
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

    @task = @project.tasks.build
  end

  def archive
    @project = Project.find(params[:id])
    unless @project.archive?
      @project.update(status: :archive)
    end

    render :show
  end

  def destroy
    @project = Project.find(params[:id])
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
