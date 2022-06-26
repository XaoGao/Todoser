module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    def token_authenticate_user
      header = request.headers["Authorization"]

      if header.blank? || header.split.first != "Bearer"
        render status: :unauthorized, json: { error: t("api.errors.unauthorized") } and return
      end

      token = header.split.last
      begin
        decoded = JwtService.decode(token)
        @current_user ||= User.find(decoded[:id])
      rescue ActiveRecord::RecordNotFound
        render status: :unauthorized, json: { error: t("api.errors.not_found") }
      rescue JWT::DecodeError
        render status: :unauthorized, json: { error: t("api.errors.unauthorized") }
      end
    end

    def current_user
      @current_user
    end
  end
end
