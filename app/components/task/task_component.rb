# frozen_string_literal: true

class Task::TaskComponent < ViewComponent::Base
  attr_reader :project, :task

  def initialize(project, task)
    @project = project
    @task = task
  end

  def dom_id
    "task-#{task.id}"
  end
end
