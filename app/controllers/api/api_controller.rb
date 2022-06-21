module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    def token_authenticate_user
      token = request.headers["Authorization"]
      if token.present?
        token = token.split.last
        decoded = JwtService.decode(token)
        @current_user ||= User.find(decoded[:id])
      else
        render status: :unauthorized, json: { error: I18n.t("api.errors.unauthorized") }
      end
    end
  end
end
