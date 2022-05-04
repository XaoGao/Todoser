# frozen_string_literal: true

class Button::BaseComponent < ViewComponent::Base
  attr_reader :label, :path, :icon, :classes, :option

  def initialize(label, path, option = {})
    @label = label
    @path = path
    @icon = option[:icon]
    @classes = get_classes(option)
    @option = option
  end

  alias icon? icon

  def default_classes
    ""
  end

  private

  def get_classes(option)
    if option[:class].nil?
      option[:class] = default_classes
    else
      option[:class] = "#{option[:class]} #{default_classes}"
    end
  end
end
