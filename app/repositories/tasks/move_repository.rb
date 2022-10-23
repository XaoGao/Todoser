module Tasks
  class MoveRepository
    def from(task)
      Task
        .where("project_id = ? AND status = ? AND position > ?", task.project.id, Task.statuses[task.status], task.position)
        .update_all("position=position-1")
    end

    def to(task, new_status, new_position)
      Task
        .where("project_id = ? AND status = ? AND position >= ?", task.project.id, Task.statuses[new_status], new_position)
        .update_all("position=position+1")
    end
  end
end
