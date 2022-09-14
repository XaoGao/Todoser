class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @invitation = Invitation.new(project_id: @project.id, email: params[:email])

    if @invitation.save
      return head :ok
    else
      head :bad_request
    end
  end

  def agree

  end

  private
  # def invitations_params
  #   params.require(:invitation).permit(:recipient_id, :agree, :delete_at)
  # end
end
