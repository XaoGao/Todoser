class Admin::AdminController < ApplicationController
  before_filter :authenticate_admin!
  # TODO: Подумать как можно проверять роль пользователя внутри метода :authenticate_user! для нужного routes
  def authenticate_admin!
    user_signed_in? && current_user.admin?
  end
end
