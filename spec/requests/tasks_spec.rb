require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }
  let!(:project_member) { create(:project_member, user: user, project: project) }

  describe "GET project/{project_id}/tasks" do
    context "when user is sign in" do
      before do
        sign_in user
      end

      it "http success" do
        get project_tasks_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get project_tasks_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "GET /projects/{project_id}/tasks/new" do
    context "when user is sign in" do
      before do
        sign_in user
      end

      it "http success" do
        get new_project_task_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get new_project_task_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "POST project/{project_id}/tasks" do
    let(:task) { build(:task, author: nil, project: nil) }

    context "when user is sign in" do
      before do
        sign_in user
        post project_tasks_path(project), params: { task: task.attributes }
      end

      it "http redirect after success" do
        expect(response).to have_http_status(:redirect)
      end

      it "create a new task" do
        expect(Task.first.title).to eq(task.title)
      end
    end

    context "when user is not sign in" do
      before do
        post project_tasks_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "GET /projects/{project_id}/tasks/edit" do
    let(:task) { create(:task, author: user, project: project) }

    context "when user is sign in" do
      before do
        sign_in user
      end

      it "http success" do
        get edit_project_task_path(project, task)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get edit_project_task_path(project, task)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "PUT project/{project_id}/tasks/{id}" do
    let(:task) { create(:task, title: "title before", author: user, project: project) }
    let(:new_task) { build(:task, title: "title after", author: user, project: project) }

    context "when user is sign in" do
      before do
        sign_in user
        put project_task_path(project, task), params: { task: new_task.attributes }
      end

      it "http redirect after success" do
        expect(response).to have_http_status(:redirect)
      end

      it "update a task" do
        expect(Task.first.title).to eq(new_task.title)
      end
    end

    context "when user is not sign in" do
      before do
        put project_task_path(project, task)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "GET /projects/{project_id}/tasks/{id}" do
    let(:task) { create(:task, title: "title before", author: user, project: project) }

    context "when user is sign in" do
      before do
        sign_in user
      end

      it "http success" do
        get project_task_path(project, task)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get project_task_path(project, task)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "DELETE project/{project_id}/tasks/{id}" do
    let(:task) { create(:task, delete_at: nil, author: user, project: project) }

    context "when user is sign in" do
      before do
        sign_in user
        delete project_task_path(project, task)
      end

      it "http redirect after success" do
        expect(response).to have_http_status(:redirect)
      end

      it "destroy a task" do
        expect(Task.first.delete_at).not_to be_nil
      end
    end

    context "when user is not sign in" do
      before do
        delete project_task_path(project, task)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
