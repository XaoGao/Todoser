require 'rails_helper'

RSpec.describe "TaskProjectMarks", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }
  let(:mark) { create(:mark) }
  let!(:project_mark) { create(:project_mark, project: project, mark: mark) }
  let(:task) { create(:task, project: project) }

  describe "POST /projects/:project_id/tasks/:id/mark" do
    context "when user is sign in" do
      before do
        sign_in user
        create(:project_member, user: user, project: project)
      end

      it "create a new task_project_mark" do
        post mark_project_task_path(project, task), params: { task: task.id, mark: mark.color }
        expect(TaskProjectMark.all.count).to eq(1)
      end
    end

    context "when user is not sign in" do
      before do
        post mark_project_task_path(project, task)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "DELETE /projects/:project_id/tasks/:id/mark" do
    context "when user is sign in" do
      before do
        sign_in user
        create(:project_member, user: user, project: project)
        create(:task_project_mark, project_mark: project_mark, task: task)
      end

      it "destroy a task_project_mark" do
        delete mark_project_task_path(project, task), params: { task: task.id, mark: mark.color }
        expect(TaskProjectMark.all.count).to eq(0)
      end
    end

    context "when user is not sign in" do
      before do
        delete mark_project_task_path(project, task)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
