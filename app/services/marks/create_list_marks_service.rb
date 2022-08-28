module Marks
  class CreateListMarksService < Service
    def call(project)
      Mark.all.each do |mark|
        project.project_marks.create(mark: mark)
      end
    end
  end
end
