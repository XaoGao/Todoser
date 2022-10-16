class InvitationsController < ApplicationController
  include AutoInject["invitation_create_service", "invitation_confirm_service"]

  before_action :authenticate_user!

  def new
    @project = Project.find(params[:project_id])

    authorize! @project, with: InvitationPolicy

    @invitation = Invitation.new

    respond_to do |format|
      format.js { render json: { data: render_invitation(@project, @invitation) }, status: :ok }
      format.html { render :new }
    end
  end

  def create
    project = Project.find(params[:project_id])

    authorize! project, with: InvitationPolicy

    result = invitation_create_service.call(params[:invitation][:email], current_user, project)

    if result.success?
      redirect_to project_path(project), notice: result.data
    else
      redirect_to project_path(project), alert: result.error_messages
    end
  end

  def confirm
    invitation = Invitation.find_by(token: params[:token], agree: nil)

    if invitation.nil?
      return redirect_to root_path, alert: t(".not_found")
    end

    authorize! invitation, with: InvitationPolicy

    invitation_confirm_service.call(invitation)

    redirect_to project_path(invitation.project)
  end

  def render_invitation(project, invitation)
    ApplicationController.render(partial: 'invitations/form', locals: { invitation: invitation, project: project })
  end
end
