module Projects
  class CreateProjectService < Service
    def call(project, user)
      ActiveRecord::Base.transaction do
        if project.save
          Marks::CreateListMarksService.new.call(project)
          ProjectMember.create(user: user, project: project)
          success(I18n.t("projects.create.successful", project_name: project.title))
        else
          failure(I18n.t("projects.create.error", project_name: project.title))
        end
      rescue
        failure(I18n.t("errors.unexpected_error"))
      end
    end
  end
end
