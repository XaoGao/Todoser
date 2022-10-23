module Tasks
  class MoveService < Service
    include AutoInject["task_move_repository"]

    def call(task, new_status, new_position, task_move_params)
      ActiveRecord::Base.transaction do
        task_move_repository.from(task)
        task_move_repository.to(task, new_status, new_position)
        task.update task_move_params
        success(task)
      rescue # Specify error classes after errors customization
        failure(I18n.t("errors.unexpected_error"))
      end
    end
  end
end
