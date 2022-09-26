# frozen_string_literal: true

class User::SmallAvatarComponent < User::AvatarComponent
  def default_class
    "rounded-circle"
  end

  def default_size
    "35x35"
  end
end
