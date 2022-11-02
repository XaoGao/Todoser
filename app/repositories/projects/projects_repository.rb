module Projects
  class ProjectsRepository
    def find(id)
      Project.find(id)
    end

    def where(options)
      Project.where(options)
    end
  end
end
