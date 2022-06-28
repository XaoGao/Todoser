class TaskFavoriteQuery
  attr_reader :project, :user

  def initialize(project, user)
    @project = project
    @user = user
  end

  def tasks_list_of(task_status)
    project
      .tasks
      .public_send(task_status)
      .joins("LEFT JOIN favorites ON favorites.favoriteable_type = 'Task' AND favorites.favoriteable_id = tasks.id AND favorites.delete_at IS NULL AND favorites.user_id = #{user.id}")
      .select("tasks.*, favorites.id is not null as favorited")
      .order(:position)
  end
end
