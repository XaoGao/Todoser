# frozen_string_literal: true

class Button::BaseComponent < ViewComponent::Base
  attr_reader :label, :path, :icon, :classes, :options

  def initialize(options = {})
    @label = options[:label] || ""
    @path = options[:path] || ""
    @icon = options[:icon]
    @classes = get_classes(options)
    @options = options
  end

  alias icon? icon

  def default_classes
    ""
  end

  private

  def get_classes(options)
    options[:class] = if options[:class].nil?
                        default_classes
                      else
                        "#{options[:class]} #{default_classes}"
                      end
  end
end
