require 'rails_helper'

RSpec.describe Users::SessionCreateUserService do
  let(:service) { described_class.new }
  let(:user) { create(:user) }
  let(:token) { JwtService.encode(id: user.id, email: user.email, username: user.username) }

  describe ".call" do
    it "email and password are valid" do
      result = service.call(email: user.email, password: "password")
      expect(result.success?).to be true
      expect(result.data).to eq token
    end

    it "email is nil" do
      result = service.call(password: "password")
      expect(result.failure?).to be true
      expect(result.error_messages).to eq I18n.t("api.v1.sessions.errors.no_email_and_password")
    end

    it "password is nil" do
      result = service.call(email: user.email)
      expect(result.failure?).to be true
      expect(result.error_messages).to eq I18n.t("api.v1.sessions.errors.no_email_and_password")
    end

    it "user is not found" do
      result = service.call(email: "wrong@email.com", password: "password")
      expect(result.failure?).to be true
      expect(result.error_messages).to eq I18n.t("api.v1.sessions.errors.user_not_found_blocked")
    end

    it "user is blocked" do
      # TODO: implements after add delete_at field to users model and enable? method
    end

    it "password is invalid" do
      result = service.call(email: user.email, password: "wrong password")
      expect(result.failure?).to be true
      expect(result.error_messages).to eq I18n.t("api.v1.sessions.errors.incorrect_email_or_password")
    end
  end
end
