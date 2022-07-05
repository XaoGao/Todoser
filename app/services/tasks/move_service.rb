module Tasks
  class MoveService < Service
    def call(task, new_status, new_position, task_move_params)
      task = Task.find(params[:id])

      tasks_old_column = Task.where("status = ? AND position > ?", Task.statuses[task.status], task.position)
      tasks_new_column = Task.where("status = ? AND position >= ?", Task.statuses[new_status], new_position)

      success(task)
    end

    private

    def transact
      ActiveRecord::Base.transaction do
        tasks_old_column.each do |t|
          t.update(position: t.position - 1)
        end

        tasks_new_column.each do |t|
          t.update(position: t.position + 1)
        end

        task.update task_move_params
      end
    end
  end
end
