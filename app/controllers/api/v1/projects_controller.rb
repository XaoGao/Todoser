module Api
  module V1
    class ProjectsController < Api::ApiController
      include AutoInject["projects_repository"]

      before_action :token_authenticate_user

      def index
        projects = current_user.member_in_project
        serialized_projects = ProjectSerializer.new(projects).serializable_hash.to_json
        ok(projects: serialized_projects)
      end

      def show
        project = projects_repository.find(params[:id])

        authorize! project

        serialized_project = ProjectSerializer.new(project).serializable_hash.to_json
        ok(project: serialized_project)
      end
    end
  end
end
