module Api
  module V1
    class ProjectsController < Api::ApiController
      before_action :token_authenticate_user

      def index
        search = current_user.member_in_project.ransack(params[:q])
        projects = search.result(distinct: true)
        serialized_projects = ProjectSerializer.new(projects).serializable_hash.to_json
        ok(projects: serialized_projects)
      end

      def show
        project = Project.find(params[:id])
        authorize! project, with: ProjectPolicy
        serialized_project = ProjectSerializer.new(project).serializable_hash.to_json
        ok(project: serialized_project)
      end

      private

      def record_not_found(exception)
        bad_request(t("api.v1.projects.errors.project_not_found"))
      end
    end
  end
end
