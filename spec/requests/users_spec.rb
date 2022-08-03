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

  describe "/change_locale" do
    before(:each) do
      sign_in user
    end

    context "with valid attributes" do
      it "must change locale" do
        put change_locale_path, params: { locale: "ru" }, headers: { "HTTP_REFERER" => root_path }
        user.reload
        expect(user.locale).to eq "ru"
        expect(response).to redirect_to request.referer
      end
    end

    context "with invalid attributes" do
      it "returns root path with emty locale" do
        put change_locale_path, params: { locale: "" }
        expect(response).to redirect_to root_path
      end

      it "returns root path with not included locale in I18n" do
        put change_locale_path, params: { locale: "us" }
        expect(response).to redirect_to root_path
      end
    end
  end
end
