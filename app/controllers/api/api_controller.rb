module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    include ApiResponders

    def token_authenticate_user
      if authorization_header.blank?
        unauthorized("api.errors.unauthorized") and return
      end

      unless authenticate_scheme_bearer?
        unauthorized("api.errors.not_bearer_type") and return
      end

      if token_blank?
        unauthorized("api.errors.blank_token") and return
      end

      begin
        set_user
      rescue ActiveRecord::RecordNotFound
        unauthorized("api.errors.not_found")
      rescue JWT::ExpiredSignature
        unauthorized("api.errors.expired_token")
      rescue JWT::DecodeError
        unauthorized("api.errors.unexpected_error")
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
