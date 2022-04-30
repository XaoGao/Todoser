class WelcomeController < ApplicationController
  before_action :redirect_signed_user
  def index; end

  private

  def redirect_signed_user
    redirect_to projects_path if user_signed_in?
  end
end
