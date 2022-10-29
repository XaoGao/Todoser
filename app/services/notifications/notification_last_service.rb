module Notifications
  class NotificationLastService < Service
    include AutoInject["notifications_repository"]

    def call(recipient)
      cache = Rails.cache.read(key(recipient))
      return success(cache) unless cache.nil?

      notifications = notifications_repository.last(recipient)
      return success(notifications) if notifications.empty?

      Rails.cache.write(key(recipient), to_json(notifications), expires_in: 15.minutes)
      success(notifications)
    end

    private

    def key(recipient)
      "notifications-last-#{recipient.id}"
    end

    def to_json(notifications)
      NotificationSerializer.new(notifications).serializable_hash.to_json
    end
  end
end
