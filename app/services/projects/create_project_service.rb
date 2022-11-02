module Projects
  class CreateProjectService < Service
    include AutoInject["create_project_member_service", "project_marks_repository"]

    def call(project, user)
      ActiveRecord::Base.transaction do
        create_project user, project
      rescue StandardError => e
        handle_error e
      end
    end

    private

    def create_project(user, project)
      if project.save
        created_member = create_project_member_service.call(project, user)
        return created_member if created_member.failure?

        project_marks_repository.create_for(project)

        success(I18n.t("projects.create.successful", project_name: project.title))
      else
        failure(I18n.t("projects.create.error", project_name: project.title))
      end
    end

    def handle_error(error)
      Rails.logger.error "Error when create a project:"
      Rails.logger.error error
      failure(I18n.t("errors.unexpected_error"))
    end
  end
end
