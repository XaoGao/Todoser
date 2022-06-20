module Api
  module V1
    class SessionsController < Api::ApiController
      def create
        if params[:email].nil? || params[:password].nil?
          render status: :bad_request,
                 json: { error: I18n.t("api.v1.sessions.errors.no_email_and_password") } and return
        end

        user = User.find_by email: params[:email]
        if user.blank? || !user.enable?
          render status: :bad_request,
                 json: { error: I18n.t("api.v1.sessions.errors.user_not_found_blocked") } and return
        end

        if !user.valid_password?(params[:password])
          render status: :bad_request,
                 json: { error: I18n.t("api.v1.sessions.errors.incorrect_email_or_password") } and return
        end

        token = JwtService.encode(id: user.id, email: user.email, username: user.username)
        render status: :ok, json: { token: token }
      end
    end
  end
end
