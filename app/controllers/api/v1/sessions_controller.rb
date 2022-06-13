module Api
  module V1
    class SessionsController < Api::ApiController
      def create
        if params[:email].nil? || params[:password].nil?
          render status: :bad_request, json: { error: I18n.t('errors.no_email_and_password') } and return
        end

        user = User.find_by email: params[:email]
        if user.present? && user.enable?
          if user.valid_password?(params[:password])
            token = JwtService.encode({ id: user.id, email: user.email, username: user.username })
            render status: :ok, json: { token: token }
          else
            render status: :bad_request, json: { error: I18n.t('errors.incorrect_password') }
          end
        else
          render status: :bad_request, json: { error: I18n.t('errors.user_not_found_blocked') }
        end
      end
    end
  end
end
