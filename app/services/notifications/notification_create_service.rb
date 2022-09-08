module Notifications
  class NotificationCreateService < Service
    def call(sender, recipient, message, level = "info")
      return failure(I18n.t("notifications.errors.empty_message")) if message.blank?
      return failure(I18n.t("notifications.errors.deleted_user")) unless users_enable?(sender, recipient)

      notification = Notification.new(sender: sender, recipient: recipient, body: message)
      if notification.save
        broadcast(recipient, message, level)
        success(notification)
      else
        failure(notification.errors.full_messages)
      end
    end

    private

    def users_enable?(sender, recipient)
      sender.enable? && recipient.enable?
    end

    def broadcast(recipient, message, level)
      if recipient.online?
        ActionCable.server.broadcast "notification_channel: #{recipient.id}", message: message, level: level
      end
    end
  end
end
