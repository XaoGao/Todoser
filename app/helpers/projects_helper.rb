module ProjectsHelper
  # TODO: removeto view component
  def project_description_placeholder(project)
    if project.description.empty?
      t("projects.show.description_placeholder")
    else
      project.description
    end
  end

  def button_to_archive(project)
    unless project.archive?
      link_to(t("button.archive"), archive_project_path(project), class: "btn btn-danger ml-3", method: :put)
    end
  end
end
