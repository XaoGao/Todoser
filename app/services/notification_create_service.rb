class NotificationCreateService < Service
  def call(sender, recipient, message, level = "info")
    return failure(I18n.t("errors.empty_message")) if message.blank?
    return failure(I18n.t("errors.deleted_user")) unless sender.enable? && recipient.enable?

    notification = Notification.new(sender: sender, recipient: recipient, body: message)
    if notification.save
      if recipient.online?
        ActionCable.server.broadcast "notification_channel: #{recipient_id}", message: message, level: level
      end
      success(notification)
    else
      failure(notification.errors.full_messages)
    end
  end
end
