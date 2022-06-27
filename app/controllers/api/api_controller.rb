module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    def token_authenticate_user
      if authorization_header.blank?
        render status: :unauthorized, json: { error: t("api.errors.unauthorized") } and return
      end

      unless authenticate_scheme_bearer?
        render status: :unauthorized, json: { error: t("api.errors.not_bearer_type") } and return
      end

      if token_blank?
        render status: :unauthorized, json: { error: t("api.errors.blank_token") } and return
      end

      begin
        set_user
      rescue ActiveRecord::RecordNotFound
        render status: :unauthorized, json: { error: t("api.errors.not_found") }
      rescue JWT::ExpiredSignature
        render status: :unauthorized, json: { error: t("api.errors.expired_token") }
      rescue JWT::DecodeError
        render status: :unauthorized, json: { error: t("api.errors.unexpected_error") }
      end
    end

    private

    def authorization_header
      request.headers["Authorization"]
    end

    def token
      authorization_header.split.last
    end

    def authenticate_scheme_bearer?
      authenticate_scheme == "Bearer"
    end

    def authenticate_scheme
      authorization_header.split.first
    end

    def decoded
      JwtService.decode(token)
    end

    def token_blank?
      token == authenticate_scheme
    end

    def set_user
      @current_user = User.find(decoded[:id])
    end
  end
end
