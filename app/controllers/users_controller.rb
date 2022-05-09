class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @projects = current_user.member_in_project
  end
end
