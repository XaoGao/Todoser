# frozen_string_literal: true

class Task::TaskComponent < ViewComponent::Base
  attr_reader :project, :task, :status

  def initialize(project, status, task)
    @project = project
    @task = task
    @status = status
  end

  def icon
    priority_icons[task.priority.to_sym]
  end

  def priority_icons
    {
      lowest: "fa-solid fa-angles-down lowest",
      low: "fa-solid fa-angle-down low",
      medium: "fa-solid fa-equals medium",
      high: "fa-solid fa-angle-up high",
      highest: "fa-solid fa-angles-up highest"
    }
  end

  def executor_full_name
    task.executor.blank? ? "" : task.executor.full_name
  end
end
