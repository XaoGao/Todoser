class ProjectMarksController < ApplicationController
  before_action :authenticate_user!

  def edit
    @project = Project.find(params[:project_id])

    authorize! @project

    @mark = Mark.find(params[:mark_id])
    result = ProjectMarks::EditTitleProjectMarkService.new.call(@project, @mark, params[:title])
    if result.success?
      head :ok
    else
      head :bad_request
    end
  end
end
