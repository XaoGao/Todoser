class NotificationsController < ApplicationController
  include AutoInject["notification_last_service"]

  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).page(params[:page])
  end

  def show
    @notification = Notification.find(params[:id])
  end

  def last
    result = notification_last_service.call(current_user)

    respond_to do |format|
      format.json { render json: { data: result.data }, status: :ok }
    end
  end
end
