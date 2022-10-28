module Notifications
  class NotificationLastService < Service
    include AutoInject["notifications_repository"]

    def call(recipient)
      # TODO: addcache
      success(notifications_repository.last(recipient))
    end
  end
end
