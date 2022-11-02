module Tasks
  class TasksRepository
    def find(id)
      Task.find(id)
    end

    def where(options)
      Task.where(options)
    end
  end
end
