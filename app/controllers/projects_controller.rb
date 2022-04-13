class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build project_params
    if @project.save
      render :show, notice: "ok"
    else
      redirect_to projects_path, alert: "bad"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update project_params
      redirect_to projects_path
    end
  end

  def show
    @project = Project.find(params[:id])
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
    params.require(:project).permit(:title)
  end
end
