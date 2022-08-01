require "swagger_helper"

RSpec.describe "Api::V1::SessionsController", type: :request do
  let(:user) { create(:user) }

  path "/api/v1/login" do
    post "creates a new session" do
      tags "Login"
      description "creates a new JWT token"
      consumes "application/json"
      produces "application/json"
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response(200, "success") do
        let(:params) { { email: user.email, password: user.password } }
        let(:token) { JwtService.encode(id: user.id, email: user.email, username: user.username) }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["token"]).to eq(token)
        end
      end

      response(400, "failure") do
        context "when email is nil" do
          let(:params) { { password: "password" } }

          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data["error"]).to eq(I18n.t("api.v1.sessions.errors.no_email_and_password"))
          end
        end

        context "when password is nil" do
          let(:params) { { email: "example@email.com" } }

          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data["error"]).to eq(I18n.t("api.v1.sessions.errors.no_email_and_password"))
          end
        end

        context "when user is not found" do
          let(:params) { { email: "example@email.com", password: "password" } }

          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data["error"]).to eq(I18n.t("api.v1.sessions.errors.user_not_found_blocked"))
          end
        end

        context "when user is blocked" do
          # TODO: implements after add delete_at field to users model and enable? method
        end

        context "when password is invalid" do
          let(:params) { { email: user.email, password: "wrong password" } }

          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data["error"]).to eq(I18n.t("api.v1.sessions.errors.incorrect_email_or_password"))
          end
        end
      end
    end
  end
end
