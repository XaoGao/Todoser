# frozen_string_literal: true

class User::AvatarComponent < ViewComponent::Base
  attr_reader :user, :size, :classes, :title

  # TODO: may be create abstract avatar component and user_avatar_component
  def initialize(user:, **options)
    @user = user
    @size = options[:size] || default_size
    @classes = create_classes options
    @title = options[:title] || ""
  end

  def avatar
    user.avatar.attached? ? user.avatar : "default_avatar.png"
  end

  def create_classes(options = {})
    class_empty?(options) ? default_class : "#{options[:class]} #{default_class}"
  end

  def class_empty?(options)
    options[:class].nil? || options[:class] == ""
  end

  def default_class
    ""
  end

  def default_size
    "100x100"
  end
end
