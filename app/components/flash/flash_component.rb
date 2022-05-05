# frozen_string_literal: true

class Flash::FlashComponent < ViewComponent::Base
  def initialize()
  end

  def flash_class(type)
    case type
    when "notice"
      "alert alert-success alert-dismissible"
    when "alert"
      "alert alert-danger alert-dismissible"
    end
  end
end
