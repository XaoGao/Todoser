class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favoriteable, except: [:index]

  def index
    # TODO: refactor for polymorphic or we use favorite only for task
    @favorites = current_user.active_favorites
  end

  def create
    authorize! @favoriteable, with: FavoritePolicy

    @favorite = Favorite.new(favoriteable: @favoriteable, user: current_user)
    if @favorite.save
      head :ok
    else
      head :bad_request
    end
  end

  def destroy
    authorize! @favoriteable, with: FavoritePolicy

    @favorite = @favoriteable.favorites.find_by(user: current_user)
    if @favorite.blank?
      head :bad_request
    end

    if @favorite.update(delete_at: DateTime.now)
      head :ok
    else
      head :bad_request
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
