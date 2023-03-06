class Admin::UsersController < ApplicationController
  def index
    @users = User.all.order("id ASC").page params[:page]
  end
end
