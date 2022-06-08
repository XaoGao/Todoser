module Tasks
  class MoveService < Service
    def call(task, new_status, new_position)
      task = Task.find(params[:id])

      tasks_old_column = Task.where("status = ? AND position > ?", Task.statuses[task.status], task.position)
      tasks_new_column = Task.where("status = ? AND position >= ?", Task.statuses[params[:status]], params[:position])
    end
  end
end
