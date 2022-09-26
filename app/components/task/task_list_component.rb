# frozen_string_literal: true

class Task::TaskListComponent < ViewComponent::Base
  attr_reader :project, :tasks

  def initialize(project:, tasks:)
    @project = project
    @tasks = tasks
  end

  def statuses_for_list
    Task.statuses.except(:archive)
  end
end
