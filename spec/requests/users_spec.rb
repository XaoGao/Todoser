require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe "GET dashboard" do
    context "user is sign in" do
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get dashboard_path
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "return to a login page" do
        get dashboard_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
