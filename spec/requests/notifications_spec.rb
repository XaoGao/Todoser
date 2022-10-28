require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  describe "GET /norifications" do
    context "when user is sign in" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "http status success" do
        get notifications_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get notifications_path
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

  describe "GET /norifications/{norification_id}" do
    let(:sender) { create(:user) }
    let(:recipient) { create(:user) }

    let(:notification) { create(:notification, sender: sender, recipient: recipient) }

    context "when user is sign in" do
      before do
        sign_in recipient
      end

      it "http status success" do
        get notification_path(notification)
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not sign in" do
      before do
        get notification_path(notification)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end
end
