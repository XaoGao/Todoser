require "rails_helper"

describe ApiAuthenticate, type: :controller do
  controller(ApplicationController) do
    before_action :token_authenticate_user

    include ApiResponders
    include ApiAuthenticate

    def fake_action
      head :no_content
    end
  end

  let(:user) { create(:user) }
  let(:token) { JwtService.encode(id: user.id) }
  let(:expired_token) { JwtService.encode({id: user.id}, DateTime.now) }
  let(:incorrect_token) { JwtService.encode(id: 'wrong value') }

  before do
    routes.draw { get "fake_action", to: "anonymous#fake_action" }
  end

  describe "#token_authenticate_user" do
    it "bearer token is valid" do
      request.headers["Authorization"] = "Bearer #{token}"
      get :fake_action
      expect(controller.current_user).to eq(user)
    end

    it "authorization header is nil" do
      request.headers["Authorization"] = nil
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end

    it "authorization header is blank" do
      request.headers["Authorization"] = " "
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
    end

    it "token is not bearer type" do
      request.headers["Authorization"] = "Basic #{token}"
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.not_bearer_type")
    end

    it "token is blank" do
      request.headers["Authorization"] = "Bearer "
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.blank_token")
    end

    it "user not found" do
      request.headers["Authorization"] = "Bearer #{incorrect_token}"
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.not_found")
    end

    it "token is expired" do
      request.headers["Authorization"] = "Bearer #{expired_token}"
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.expired_token")
    end

    it "bearer token can't be decoded" do
      request.headers["Authorization"] = "Bearer 7351c74d.ed9f7e.f9e23db7.c3cfb1c0d3e"
      get :fake_action
      expect(response).to have_http_status(:unauthorized)
      expect(json_response["error"]).to eq I18n.t("api.errors.unexpected_error")
    end
  end
end
