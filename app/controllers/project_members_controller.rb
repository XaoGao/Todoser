class ProjectMembersController < ApplicationController
  include AutoInject["projects_repository"]

  before_action :authenticate_user!

  def leave
    project = projects_repository.find(params[:project_id])

    authorize! project

    project.members.delete(current_user)
    redirect_to projects_path, notice: t("projects.destroy.success", project_name: project.title)
  end

  private

  def project_members_params
    params.require(:project_member).permit(:email, :project_id)
  end
end
