module Tasks
  class TaskFavoriteRepository
    def call(project, user)
      project
        .tasks
        .joins("LEFT JOIN favorites ON favorites.favoriteable_type = 'Task' AND favorites.favoriteable_id = tasks.id AND favorites.delete_at IS NULL AND favorites.user_id = #{user.id}")
        .select("tasks.*, favorites.id is not null as favorited")
        .order(:position)
    end
  end
end
