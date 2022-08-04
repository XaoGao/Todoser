class TaskProjectMarksController < ApplicationController
  before_action :authenticate_user!

  # TODO: create a service object create
  def create
    task = Task.find(params[:id])

    # TODO: enable when will create a task_policy
    # authorize! task

    mark = Mark.find_by(color: params[:mark])

    if mark.blank?
      redirect_to project_task_path(task.project, task), alert: t(".mark_is_not_exist")
    end

    project_mark = ProjectMark.find_by(project: task.project, mark: mark)

    if project_mark.blank?
      redirect_to project_task_path(task.project, task), alert: t(".project_mark_not_exist")
    end

    TaskProjectMark.create(project_mark: project_mark, task: task)

    # async method
    head :ok
  end

  # TODO: create a service object destroy
  def destroy
    task = Task.find(params[:id])

    # TODO: enable when will create a task_policy
    # authorize! task

    mark = Mark.find_by(color: params[:mark])

    if mark.blank?
      redirect_to project_task_path(task.project, task), alert: t(".mark_is_not_exist")
    end

    project_mark = ProjectMark.find_by(project: task.project, mark: mark)

    if project_mark.blank?
      redirect_to project_task_path(task.project, task), alert: t(".project_mark_not_exist")
    end

    task_project_mark = TaskProjectMark.find_by(project_mark: project_mark, task: task)
    if task_project_mark.blank?
      redirect_to project_task_path(task.project, task), alert: t(".task_project_mark_not_exist")
    end

    task_project_mark.destroy

    # async method
    head :ok
  end
end
