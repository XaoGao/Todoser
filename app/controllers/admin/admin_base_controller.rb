module Admin
  class AdminBaseController < ApplicationController
    before_action :authenticate_user!

    def authenticate_admin!
      if !current_user.admin?
        redirect_to root_path, alert: I18n.t("errors.unauthorized")
      end
    end
  end
end
