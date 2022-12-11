require 'rails_helper'

RSpec.describe Admin::AdminBaseController, type: :controller do
  controller do
    def fake_action
      authenticate_admin!
      head :ok
    end
  end

  before do
    routes.draw { get "fake_action" => "admin/admin_base#fake_action" }
  end

  describe ".authenticate_admin!" do
    context "when user is a admin" do
      let(:user) { create(:user, role: User.roles[:admin]) }

      it "success" do
        sign_in user
        get :fake_action
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not a admin" do
      let(:user) { create(:user, role: User.roles[:user]) }

      it "not access" do
        sign_in user
        get :fake_action
        expect(response).to have_http_status(:redirect)
        expect(flash[:alert]).to eq(I18n.t("errors.unauthorized"))
      end
    end
  end
end
