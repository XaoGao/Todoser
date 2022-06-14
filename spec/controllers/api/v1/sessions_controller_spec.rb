require "rails_helper"

RSpec.describe Api::V1::SessionsController do
  subject { described_class }

  let(:user) { create(:user) }
  let(:token) { JwtService.encode(id: user.id, email: user.email, username: user.username) }

  it "routes correctly" do
    expect(post: "api/v1/login").to route_to("api/v1/sessions#create")
  end

  describe "#create" do
    it "email and password are valid" do
      post :create, params: { email: user.email, password: "password" }
      expect(JSON.parse(response.body)["token"]).to eq token
    end

    it "email is nil or empty" do
      post :create, params: { password: "password" }
      expect(JSON.parse(response.body)["error"]).to eq I18n.t("api.v1.sessions.errors.no_email_and_password")
    end

    it "password is nil or empty" do
      post :create, params: { email: user.email }
      expect(JSON.parse(response.body)["error"]).to eq I18n.t("api.v1.sessions.errors.no_email_and_password")
    end

    it "user is not found" do
      post :create, params: { email: "wrong@email.com", password: "password" }
      expect(JSON.parse(response.body)["error"]).to eq I18n.t("api.v1.sessions.errors.user_not_found_blocked")
    end

    it "user is blocked" do
      # TODO: implements after add delete_at field to users model and enable? method
    end

    it "password is invalid" do
      post :create, params: { email: user.email, password: "wrong_password" }
      expect(JSON.parse(response.body)["error"]).to eq I18n.t("api.v1.sessions.errors.incorrect_email_or_password")
    end
  end
end
