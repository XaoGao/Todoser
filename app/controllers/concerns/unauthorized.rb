module Unauthorized
  extend ActiveSupport::Concern

  included do
    rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = I18n.t("errors.unauthorized")
      redirect_back_or_to root_path
    end

    def redirect_back_or_to(some_path)
      redirect_to(request.referer || some_path)
    end
  end
end
