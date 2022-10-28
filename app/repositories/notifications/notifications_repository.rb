module Notifications
  class NotificationsRepository
    def last(recipient)
      Notification.where(recipient: recipient).order(:created_at).take(3)
    end
  end
end
