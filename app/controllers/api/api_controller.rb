module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    include ApiResponders
    include ApiAuthenticate

    private

    def user_not_authorized
      unauthorized(t("api.errors.unauthorized"))
    end
  end
end
