require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /projects" do
    context "when user is sign in" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "http status success" do
        get projects_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get projects_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "GET /projects/new" do
    context "when user is sign in" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "http status success" do
        get new_project_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get new_project_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "POST /projects/" do
    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:project) { build(:project) }

      before do
        sign_in user
        post projects_path, params: { project: project.attributes }
      end

      it "http status success" do
        expect(response).to have_http_status(:success)
      end

      it "create a new project" do
        expect(Project.first.title).to eq(project.title)
      end
    end

    context "when user is not sign in" do
      before do
        post projects_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "GET /projects/{project_id}" do
    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project, author: user) }

      before do
        sign_in user
      end

      it "http status success" do
        get project_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      let(:project) { create(:project) }

      before do
        get project_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "GET /projects/edit" do
    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project, author: user) }

      before do
        sign_in user
      end

      it "http status success" do
        get edit_project_path(project)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      let(:project) { create(:project) }

      before do
        get edit_project_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "PUT /projects/{project_id}" do
    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:project) { build(:project) }

      before do
        sign_in user
        post projects_path, params: { project: project.attributes }
      end

      it "http status success" do
        expect(response).to have_http_status(:success)
      end

      it "update the project" do
        expect(Project.first.title).to eq(project.title)
      end
    end

    context "when user is not sign in" do
      before do
        post projects_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path } 
    end
  end

  describe "DELETE /projects/{project_id}" do
    context "when user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project) }

      before do
        sign_in user
        delete project_path(project)
      end

      it "http status success" do
        expect(response).to have_http_status(:success)
      end

      it "convert the project to disabled" do
        expect(Project.disabled.count).to eq(1)
      end
    end

    context "when user is not sign in" do
      let(:project) { create(:project) }

      before do
        delete project_path(project)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
