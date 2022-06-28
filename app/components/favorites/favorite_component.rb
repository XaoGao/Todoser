# frozen_string_literal: true

class Favorites::FavoriteComponent < ViewComponent::Base
  attr_reader :favoriteable, :user, :status

  # TODO: refactor use ActiveSupport::CurrentAttributes for user
  def initialize(favoriteable:, user:)
    @favoriteable = favoriteable
    @user = user
    @status = favoriteable.favorited
  end

  def type
    favoriteable.class.to_s
  end

  def id
    favoriteable.id
  end

  def classes
    status ? "fa-solid fa-star favorited" : "fa-regular fa-star"
  end
end
