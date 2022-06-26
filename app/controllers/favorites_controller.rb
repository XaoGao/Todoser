class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favoriteable, except: [:index]

  def index
    # TODO: refactor for polymorphic or we use favorite only for task
    @favorites = current_user.active_favorites_tasks
  end

  def create
    authorize! @favoriteable, with: FavoritePolicy

    # TODO: create a CreateFavoriteService
    @favorite = @favoriteable.favorites.find_by(user: current_user)
    # already exist
    if @favorite.present? && @favorite.delete_at.nil?
      return render json: { errors: t(".already_favorited") }, status: :bad_request
    end

    # enable old favorite
    if @favorite.present? && !@favorite.delete_at.nil?
      @favorite.update(delete_at: nil)
      return head :ok
    end

    @favorite = Favorite.new(favoriteable: @favoriteable, user: current_user)
    if @favorite.save
      head :ok
    else
      render json: { errors: t(".unknow_error") }, status: :bad_request
    end
  end

  def destroy
    authorize! @favoriteable, with: FavoritePolicy

    # TODO: create a DestroyFavoriteService
    @favorite = @favoriteable.favorites.find_by(user: current_user)
    if @favorite.blank?
      return render json: { errors: t(".not_exist") }, status: :bad_request
    end

    if @favorite.present? && !@favorite.delete_at.nil?
      return render json: { errors: t(".not_exist") }, status: :bad_request
    end

    if @favorite.update(delete_at: DateTime.now)
      head :ok
    else
      render json: { errors: t(".unknow_error") }, status: :bad_request
    end
  end

  private

  # TODO: refactor for polymorphic
  def set_favoriteable
    @favoriteable = Favorites::FindFavoriteableService.new
                                                      .call!(params[:favoriteable_type], params[:favoriteable_id])
                                                      .data
  end
end
