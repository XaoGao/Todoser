module ProjectMarks
  class EditTitleProjectMarkService < Service
    def call(project, mark, title)
      project_mark = ProjectMark.find_by(project: project, mark: mark)

      return failure(I18n.t("errors.not_found")) if project_mark.nil?
      # TODO: think about this, what do if title is same?
      return failure("same text?") if project_mark.title == title

      update project_mark, title
    end

    private

    def update(project_mark, title)
      if project_mark.update(title: title)
        success project_mark
      else
        failure(I18n.t("errors.unexpected_error"))
      end
    end
  end
end
