# frozen_string_literal: true

class Favorites::FavoriteComponent < ViewComponent::Base
  attr_reader :favoriteable, :user, :status

  def initialize(favoriteable:)
    @favoriteable = favoriteable
    @user = Current.user
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
