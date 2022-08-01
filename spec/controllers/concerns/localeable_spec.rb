require 'rails_helper'

describe Localeable, type: :controller do
  controller(ApplicationController) do
    before_action :authenticate_user!
    include Localeable

    def fake_action
      head :ok
    end
  end

  before do
    routes.draw { get "fake_action" => "anonymous#fake_action" }
  end

  describe "#set_locale" do
    let(:current_user) { create(:user, locale: "ru") }

    context "when user is sign in" do
      before(:each) do
        sign_in current_user
      end

      it "locale change if user present" do
        get :fake_action
        expect(I18n.locale).to eq(current_user.locale.to_sym)
      end
    end

    context "when user is not sign in" do
      it do
        get :fake_action
        expect(I18n.locale).to eq(I18n.default_locale)
      end
    end
  end
end
