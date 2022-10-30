module Notifications
  class CachedNotificationsRepository
    include CacheRepository

    def last(recipient)
      key = "notifications-last-#{recipient.id}"

      get_or_create(key, expires_in: 15.minutes) do
        decorated.last(recipient)
      end
    end
  end
end
