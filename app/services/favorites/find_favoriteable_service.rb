module Favorites
  class FindFavoriteableService < Service
    def call!(type, id)
      if type == "Task"
        success(Task.find(id))
      else
        raise ActiveRecord::RecordNotFound, I18n.t("errors.not_found")
      end
    end
  end
end
