module Favorites
  class FindFavoriteableService < Service
    include AutoInject["tasks_repository"]

    def call!(type, id)
      case type
      when "Task"
        success(tasks_repository.find(id))
      else
        raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found")
      end
    end
  end
end
