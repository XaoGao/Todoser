require 'rails_helper'

describe Localeable, type: :controller do
  controller(ApplicationController) do
    include Localeable

    def fake_action
      head :ok
    end
  end

  before do
    routes.draw { get "fake_action" => "anonymous#fake_action" }
  end

  describe "authentication" do
    let!(:current_user) { create(:user, locale: 'ru', online: true) }

    before do
      get :fake_action
    end

    context "when user is sign in" do
      before(:each) do
        sign_in current_user
      end

      it "locale change if user present " do
        expect(I18n.locale).to eq current_user.locale.to_sym
      end
    end

    context "when user is not sign in" do
      it { expect(I18n.locale).to_not eq current_user.locale.to_sym }
    end
  end
end
