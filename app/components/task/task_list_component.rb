# frozen_string_literal: true

class Task::TaskListComponent < ViewComponent::Base
  attr_reader :project

  def initialize(project)
    @project = project
  end

  def statuses_for_list
    Task.statuses.except(:archive)
  end
  
  def tasks
    TaskFavoriteQuery.new(project, Current.user)
  end
end
