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

    json_string = NotificationSerializer.new(result.data).serializable_hash.to_json
    respond_to do |format|
      format.json { render json: { data: json_string }, status: :ok }
    end
  end
end
