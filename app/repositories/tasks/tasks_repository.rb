module Tasks
  class TasksRepository
    def find(id)
      Task.find(id)
    end

    def where(options)
      Task.where(options)
    end

    def destroy_deleted
      Task.where.not(delete_at: nil).destroy_all
    end
  end
end
