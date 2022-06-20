# frozen_string_literal: true

class Task::TaskListComponent < ViewComponent::Base
  attr_reader :project, :user

  def initialize(project, user)
    @project = project
    @user = user
  end

  def statuses_for_list
    Task.statuses.except(:archive)
  end
end
