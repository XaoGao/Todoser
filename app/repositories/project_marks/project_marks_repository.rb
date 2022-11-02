module ProjectMarks
  class ProjectMarksRepository
    def create_for(project)
      Mark.all.each do |mark|
        project.project_marks.create(mark: mark)
      end
    end
  end
end
