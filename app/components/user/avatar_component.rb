# frozen_string_literal: true

class User::AvatarComponent < ViewComponent::Base
  attr_reader :user, :size, :classes, :title

  # TODO: may be create abstract avatar component and user_avatar_component
  def initialize(user:, **options)
    @user = user
    @size = options[:size] || "50x50"
    @classes = create_classes options
    @title = options[:title] || ""
  end

  def avatar
    user.avatar.attached? ? user.avatar : "default_avatar.png"
  end

  def create_classes(options = {})
    options[:class].nil? ? default_class : "#{options[:class]} #{default_class}"
  end

  def default_class
    "rounded-circle"
  end
end
