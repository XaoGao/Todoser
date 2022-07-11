require "rails_helper"

describe Authentication, type: :controller do
  controller(ApplicationController) do
    include Authentication

    def fake_action
      head :ok
    end
  end

  before do
    routes.draw { get "fake_action" => "anonymous#fake_action" }
  end

  describe "authentication" do
    before do
      get :fake_action
    end

    context "when user is sign in" do
      let(:user) { create(:user) }

      before(:each) do
        sign_in user
      end

      # TODO: why current.user is empty?
      # it { expect(Current.user).to eq(user) }
    end

    context "when user is not sign in" do
      it { expect(Current.user).to be_nil }
    end
  end
end
