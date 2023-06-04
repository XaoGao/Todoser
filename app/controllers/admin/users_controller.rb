class Admin::UsersController < ApplicationController
  def index
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true).page(params[:page])
  end
end
