class ProjectMembersController < ApplicationController
  before_action :authenticate_user!
  
  def destroy
    project = Project.find(params[:project_id])
    authorize! project
    project_member = ProjectMember.find(params[:id])
    #TODO User.find_by(email: params[:email])
    user = project_member.user

    if user
      project_member.delete
      redirect_to project_path(project), notice: t("projects.destroy.success", project_name: project.title)
    else
      redirect_to request.referer, alert: t("projects.destroy.error", project_name: project.title)
    end
  end

  private

  def project_members_params
    params.require(:project_member).permit(:email, :project_id)
  end
end
