module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    def token_authenticate_user
      token = request.headers["Authorization"]
      token = token.split.last if token
      begin
        decoded = JwtService.decode(token)
        @current_user ||= User.find(decoded[:id])
      rescue ActiveRecord::RecordNotFound
        render status: :unauthorized, json: { error: I18n.t("api.errors.unauthorized") }
      rescue JWT::DecodeError
        render status: :unauthorized, json: { error: I18n.t("api.errors.unauthorized") }
      end
    end
  end
end
