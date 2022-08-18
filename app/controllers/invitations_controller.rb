class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @user = User.find_by(email: params[:email])
    if @user.blank?
      flash[:alert] = I18n.t("errors.user_not_found")
      redirect_to request.referer, alert: t("errors.user_not_found") and return
    end
    @invitation = Invitation.new(recipient: @user, project: @project, consumer: current_user)
    if @invitation.save

      redirect_to project_path(@project), notice: t(".successful")
    else
      redirect_to root_path
    end
  end

  def agree; end
end
