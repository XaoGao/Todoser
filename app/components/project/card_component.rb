# frozen_string_literal: true

class Project::CardComponent < ViewComponent::Base
  include ApplicationHelper

  attr_reader :project, :task

  def initialize(project:, task:)
    @project = project
    @task = task
  end

  def project_description_placeholder
    if project.description.empty?
      I18n.t("projects.show.description_placeholder")
    else
      project.description
    end
  end

  def button_to_archive
    unless project.archive?
      link_to(I18n.t("button.archive"), archive_project_path(project), class: "btn btn-danger ml-3", method: :put)
    end
  end

  def button_to_leave
    link_to(I18n.t("button.leave"), project_leave_path(project), class: "btn btn-danger ml-3", method: :delete)
  end

  def status
    I18n.t("projects.show.status", status: project.status)
  end
end
