require "rails_helper"

describe ApiResponders, type: :controller do
  controller(ApplicationController) do
    include ApiResponders
    def render_unauthorized
      unauthorized(I18n.t("api.errors.unauthorized"))
    end

    def render_bad_request
      bad_request(I18n.t("api.errors.bad_request"))
    end

    def render_empty_object
      ok
    end

    def render_object
      ok(token: "Bearer token")
    end
  end

  before do
    routes.draw do
      get :render_unauthorized, to: "anonymous#render_unauthorized"
      get :render_bad_request, to: "anonymous#render_bad_request"
      get :render_empty_object, to: "anonymous#render_empty_object"
      get :render_object, to: "anonymous#render_object"
    end
  end

  it "returns unauthorized status with error message" do
    get :render_unauthorized
    expect(response).to have_http_status(:unauthorized)
    expect(json_response["error"]).to eq I18n.t("api.errors.unauthorized")
  end

  it "returns bad_request status with error message" do
    get :render_bad_request
    expect(response).to have_http_status(:bad_request)
    expect(json_response["error"]).to eq I18n.t("api.errors.bad_request")
  end

  it "returns empty object if no argument is passed" do
    get :render_empty_object
    expect(response).to have_http_status(:ok)
    expect(json_response).to be_empty
  end

  it "returns object if argument is passed" do
    get :render_object
    expect(response).to have_http_status(:ok)
    expect(json_response["token"]).to eq "Bearer token"
  end
end
