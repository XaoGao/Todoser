class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @projects = current_user.member_in_project
  end

  def change_locale
    if locale.empty? || !I18n.available_locales.include?(locale.to_sym)
      redirect_to root_path, error: 'Unexpected error'
    else
      current_user.update!(locale: locale)
      redirect_to request.refere
    end
  end
end
