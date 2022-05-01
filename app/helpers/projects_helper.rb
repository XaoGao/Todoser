module ProjectsHelper
  # TODO: removeto view component
  def project_description_placeholder(project)
    if project.description.empty?
      t("projects.show.description_placeholder")
    else
      project.description
    end
  end
end
