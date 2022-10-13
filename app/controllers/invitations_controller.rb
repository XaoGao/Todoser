class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.find(params[:project_id])

    authorize! @project, with: InvitationPolicy

    @invitation = Invitation.new
  end

  def create
    project = Project.find(params[:project_id])

    authorize! project, with: InvitationPolicy

    user = User.find_by(email: params[:invitation][:email])
    if user.nil?
      return redirect_to root_path, alert: t(".user_not_found")
    end

    token = generate_token
    @invitation = Invitation.new(recipient: user, sender: current_user, token: token, project: project)

    if @invitation.save
      redirect_to project_path(project), notice: t(".success", username: user.full_name)
    else
      redirect_to project_path(project), alert: t(".error")
    end
  end

  def confirm
    invitation = Invitation.find_by(token: params[:token], agree: nil)

    if invitation.nil?
      return redirect_to root_path, alert: t(".not_found")
    end

    authorize! invitation, with: InvitationPolicy

    ActiveRecord::Base.transaction do
      invitation.update(agree: true)
      ProjectMember.create(project: invitation.project, user: invitation.recipient)
    end

    redirect_to project_path(invitation.project)
  end

  private

  def generate_token
    loop do
      token = SecureRandom.hex(10)

      break token unless Invitation.exists?(token: token)
    end
  end
end
