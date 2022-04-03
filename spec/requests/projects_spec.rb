require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /index" do
    context "user is sign in" do
      let(:user) { create(:user) }
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get projects_path
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        get projects_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
