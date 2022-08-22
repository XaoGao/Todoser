require "rails_helper"

RSpec.describe Api::V1::ProjectsController do
  let(:user) { create(:user) }
  let(:token) { JwtService.encode(id: user.id, email: user.email, username: user.username) }
  let(:project) { create(:project) }
  let(:task) { create(:task, project: project) }
  let(:serialized) { ProjectSerializer.new(project).serializable_hash }

  describe "GET /api/v1/projects" do
    it "serialized projects object" do
      authorization_header(token)
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/projects/:id" do
    context "when user is member for project" do
      before do
        create(:project_member, user: user, project: project)
      end

      it "serialized project object" do
        authorization_header(token)
        get :show, params: { id: project.id }
        expect(json_response["project"]).to eq serialized.to_json
      end
    end

    context "when user is not member for project" do
      it "unauthorized error" do
        authorization_header(token)
        get :show, params: { id: project.id }
        expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
      end
    end

    it "error if user unuathorized" do
      get :show, params: { id: project.id }
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end

    it "error if task is not found" do
      authorization_header(token)
      get :show, params: { id: 10 }
      expect(json_response["error"]).to eq I18n.t("api.errors.not_found")
    end
  end
end
