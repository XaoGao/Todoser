module Api
  module V1
    class TasksController < Api::ApiController
      include AutoInject["tasks_repository"]

      before_action :token_authenticate_user

      def show
        task = tasks_repository.find(params[:id])
        authorize! task, with: ApiTaskPolicy
        serialized_task = TaskSerializer.new(task).serializable_hash.to_json
        ok(task: serialized_task)
      end
    end
  end
end
