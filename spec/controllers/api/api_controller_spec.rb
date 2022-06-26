require "rails_helper"

RSpec.describe Api::ApiController do
  controller do
    before_action :token_authenticate_user

    def fake_action
      head :no_content
    end
  end

  let(:user) { create(:user) }
  let(:token) { JwtService.encode(id: user.id) }
  let(:incorrect_token) { JwtService.encode(id: 'wrong value') }

  before do
    routes.draw { get "fake_action", to: "api/api#fake_action" }
  end

  describe "#token_authenticate_user" do
    it "bearer token is valid" do
      request.headers["Authorization"] = "Bearer #{token}"
      get :fake_action
      expect(controller.current_user).to eq(user)
    end

    it "bearer token is nil" do
      request.headers["Authorization"] = nil
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end

    it "token is not bearer type" do
      request.headers["Authorization"] = "Basic #{token}"
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end

    it "user not found" do
      request.headers["Authorization"] = "Bearer #{incorrect_token}"
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.not_found")
    end

    it "bearer token can't be decoded" do
      request.headers["Authorization"] = "Bearer 7351c74d.ed9f7e.f9e23db7.c3cfb1c0d3e"
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end
  end
end
