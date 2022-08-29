require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /projects" do
    context "user is sign in" do
      let(:user) { create(:user) }
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get projects_path
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        get projects_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET /projects/new" do
    context "user is sign in" do
      let(:user) { create(:user) }
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get new_project_path
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        get new_project_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST /projects/" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { build(:project) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        post projects_path, params: { project: project.attributes }
        expect(response).to have_http_status(:success)
      end

      it "create a new project" do
        post projects_path, params: { project: project.attributes }
        new_project = Project.first
        expect(new_project.title).to eq(project.title)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        post projects_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET /projects/{project_id}" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project, author: user) }
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get project_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      let(:project) { create(:project) }

      it "returns redirect to sign in page" do
        get project_path(project)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET /projects/edit" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project, author: user) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get edit_project_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      let(:project) { create(:project) }

      it "returns redirect to sign in page" do
        get edit_project_path(project)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "PUT /projects/{project_id}" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { build(:project) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        post projects_path, params: { project: project.attributes }
        expect(response).to have_http_status(:success)
      end

      it "create a new project" do
        post projects_path, params: { project: project.attributes }
        expect(Project.first.title).to eq(project.title)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        post projects_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "DELETE /projects/{project_id}" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        delete project_path(project)
        expect(response).to have_http_status(:success)
      end

      it "create a new project" do
        delete project_path(project)
        expect(Project.disabled.count).to eq(1)
      end
    end

    context "user is not sign in" do
      let(:project) { create(:project) }

      it "returns redirect to sign in page" do
        delete project_path(project)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
