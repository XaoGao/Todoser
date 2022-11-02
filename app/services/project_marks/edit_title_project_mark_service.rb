module ProjectMarks
  class EditTitleProjectMarkService < Service
    include AutoInject["project_marks_repository"]

    def call(project, mark, title)
      project_mark = project_marks_repository.find_by(project: project, mark: mark)

      return failure(I18n.t("errors.not_found")) if project_mark.nil?

      return success(project_mark) if project_mark.title == title

      update project_mark, title
    end

    private

    def update(project_mark, title)
      if project_mark.update(title: title)
        success(project_mark)
      else
        failure(I18n.t("errors.unexpected_error"))
      end
    end
  end
end
