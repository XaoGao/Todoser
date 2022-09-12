module Tasks
  class MoveService < Service
    def call(task_id, new_status, new_position, task_move_params)
      task = Task.find(task_id)

      tasks_old_column = Task.where("status = ? AND position > ?", Task.statuses[task.status], task.position)
      tasks_new_column = Task.where("status = ? AND position >= ?", Task.statuses[new_status], new_position)

      ActiveRecord::Base.transaction do
        tasks_old_column.each do |t|
          t.update(position: t.position - 1)
        end

        tasks_new_column.each do |t|
          t.update(position: t.position + 1)
        end

        task.update task_move_params
        success(task)
      rescue # Specify error classes after errors customization
        failure(I18n.t("errors.unexpected_error"))
      end
    end
  end
end
