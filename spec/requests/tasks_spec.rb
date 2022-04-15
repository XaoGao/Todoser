require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }

  describe "GET project/{project_id}/tasks" do
    context "user is sign in" do
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get project_tasks_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        get project_tasks_path(project)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST project/{project_id}/tasks" do
    let(:task) { build(:task, author: nil, project: nil) }

    context "user is sign in" do
      before(:each) do
        sign_in user
      end

      it "returns http redirect after success" do
        post project_tasks_path(project), params: { task: task.attributes }
        expect(response).to have_http_status(:redirect)
      end

      it "create a new project" do
        post project_tasks_path(project), params: { task: task.attributes }
        expect(Task.first.title).to eq(task.title)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        post project_tasks_path(project)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "PUT project/{project_id}/tasks/{id}" do
    let(:task) { create(:task, title: "title before", author: user, project: project) }
    let(:new_task) { build(:task, title: "title after", author: user, project: project) }

    context "user is sign in" do
      before(:each) do
        sign_in user
      end

      it "returns http redirect after success" do
        put project_task_path(project, task), params: { task: new_task.attributes }
        expect(response).to have_http_status(:redirect)
      end

      it "create a new project" do
        put project_task_path(project, task), params: { task: new_task.attributes }
        expect(Task.first.title).to eq(new_task.title)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        put project_task_path(project, task)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "DELETE project/{project_id}/tasks/{id}" do
    let(:task) { create(:task, delete_at: nil, author: user, project: project) }

    context "user is sign in" do
      before(:each) do
        sign_in user
      end

      it "returns http redirect after success" do
        delete project_task_path(project, task)
        expect(response).to have_http_status(:redirect)
      end

      it "create a new project" do
        delete project_task_path(project, task)
        expect(Task.first.delete_at).not_to be_nil
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        delete project_task_path(project, task)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
