class UsersController < ApplicationController
  include AutoInject["users_repository"]

  before_action :authenticate_user!

  def show
    @user = users_repository.find(params[:id])
  end

  def dashboard
    @projects = current_user.member_in_project
  end

  def change_locale
    if params[:locale].empty? || I18n.available_locales.exclude?(params[:locale].to_sym)
      redirect_to root_path, alert: t("errors.unexpected_error")
    else
      current_user.update!(locale: params[:locale])
      redirect_to request.referer
    end
  end
end
