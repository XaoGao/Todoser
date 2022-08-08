require "rails_helper"

RSpec.describe Api::V1::ProjectsController do
  let(:user) { create(:user) }
  let(:token) { JwtService.encode(id: user.id, email: user.email, username: user.username) }
  let(:project) { create(:project) }
  let(:task) { create(:task, project: project) }
  let(:serialized) { ProjectSerializer.new(project).serializable_hash }

  describe "#index" do
    it "returns serialized projects object" do
      request.headers["Authorization"] = "Bearer #{token}"
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#show" do
    context "user is member for project" do
      before do
        create(:project_member, user: user, project: project)
      end

      it "returns serialized project object" do
        request.headers["Authorization"] = "Bearer #{token}"
        get :show, params: { id: project.id }
        expect(json_response["project"]).to eq serialized.to_json
      end
    end

    context "user is not member for project" do
      it "returns unauthorized error" do
        request.headers["Authorization"] = "Bearer #{token}"
        get :show, params: { id: project.id }
        expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
      end
    end

    it "returns error if user unuathorized" do
      get :show, params: { id: project.id }
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end

    it "returns error if task is not found" do
      request.headers["Authorization"] = "Bearer #{token}"
      get :show, params: { id: 10 }
      expect(json_response["error"]).to eq I18n.t("api.v1.projects.errors.project_not_found")
    end
  end
end
