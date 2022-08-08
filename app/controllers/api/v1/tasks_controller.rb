module Api
  module V1
    class TasksController < Api::ApiController
      before_action :token_authenticate_user

      def show
        task = Task.find(params[:id])
        authorize! task, with: ApiTaskPolicy
        serialized_task = TaskSerializer.new(task).serializable_hash.to_json
        ok(task: serialized_task)
      end

      private

      def record_not_found(exception)
        bad_request(t("api.v1.tasks.errors.task_not_found"))
      end
    end
  end
end
