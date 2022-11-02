class ProjectMarksController < ApplicationController
  include AutoInject["edit_title_project_mark_service", "projects_repository"]

  before_action :authenticate_user!

  def edit
    @project = projects_repository.find(params[:project_id])

    authorize! @project

    @mark = Mark.find(params[:mark_id])
    result = edit_title_project_mark_service.call(@project, @mark, params[:title])
    if result.success?
      head :ok
    else
      head :bad_request
    end
  end
end
