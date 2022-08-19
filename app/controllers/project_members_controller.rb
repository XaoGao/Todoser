class ProjectMembersController < ApplicationController
  before_action :authenticate_user!

  def leave
    project = Project.find(params[:project_id])
    authorize! project
    
    if user_signed_in?
      project.members.delete(current_user)
      redirect_to root_path, notice: t("projects.destroy.success", project_name: project.title)
    else
      redirect_to request.referer, alert: t("projects.destroy.error", project_name: project.title)
    end
  end

  private

  def project_members_params
    params.require(:project_member).permit(:email, :project_id)
  end
end
