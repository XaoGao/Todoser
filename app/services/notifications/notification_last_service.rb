module Notifications
  class NotificationLastService < Service
    include AutoInject["notifications_repository"]

    def call(recipient)
      notifications = notifications_repository.last(recipient)
      json = NotificationSerializer.new(notifications).serializable_hash.to_json

      success(json)
    end
  end
end
