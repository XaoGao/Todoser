require "rails_helper"

RSpec.describe Api::V1::TasksController do
  let(:user) { create(:user) }
  let(:token) { JwtService.encode(id: user.id, email: user.email, username: user.username) }
  let(:project) { create(:project) }
  let(:task) { create(:task, project: project) }
  let(:serialized) { TaskSerializer.new(task).serializable_hash }

  describe "#show" do
    context "user is member for project" do
      before do
        create(:project_member, user: user, project: project)
      end

      it "returns serialized task object" do
        request.headers["Authorization"] = "Bearer #{token}"
        get :show, params: { id: task.id }
        expect(json_response["task"]).to eq serialized.to_json
      end
    end

    context "user is not member for project" do
      it "returns unauthorized error" do
        request.headers["Authorization"] = "Bearer #{token}"
        get :show, params: { id: task.id }
        expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
      end
    end

    it "returns error if user unuathorized" do
      get :show, params: { id: task.id }
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end

    it "returns error if task is not found" do
      request.headers["Authorization"] = "Bearer #{token}"
      get :show, params: { id: 10 }
      expect(json_response["error"]).to eq I18n.t("api.v1.tasks.errors.task_not_found")
    end
  end
end
