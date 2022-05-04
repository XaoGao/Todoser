# frozen_string_literal: true

class Button::BaseComponent < ViewComponent::Base
  attr_reader :label, :path, :icon, :option

  def initialize(label, path, option)
    @label = label
    @path = path
    @icon = option[:icon]
    @option = option
  end

  alias icon? icon
end
