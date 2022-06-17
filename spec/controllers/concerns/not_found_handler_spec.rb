require "rails_helper"

describe NotFoundHandler, type: :controller do
  controller(ApplicationController) do
    include NotFoundHandler

    def fake_action
      User.find(1)
    end
  end

  before do
    routes.draw { get "fake_action" => "anonymous#fake_action" }
  end

  describe "record_not_found" do
    before do
      get :fake_action
    end

    it { expect(response).to redirect_to(root_path) }
    it { expect(flash[:alert]).to be_present }
  end
end
