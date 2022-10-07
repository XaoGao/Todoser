module Admin
  class AdminBaseController < ApplicationController
    before_action :authenticate_admin!

    def authenticate_admin!
      authorize! current_user, to: :any_admin_page?, with: AdminPolicy
    end
  end
end
