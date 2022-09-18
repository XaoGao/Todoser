# frozen_string_literal: true

class Button::BackComponent < Button::BaseComponent
  def initialize(options = {})
    label = options[:label] || I18n.t("button.back")
    path = back_path(options)
    icon = options[:icon] || "fa-solid fa-arrow-left-long"
    super(options.merge(label: label, path: path, icon: icon))
  end

  def default_classes
    "btn btn-primary"
  end

  def back_path(options)
    options[:path].nil? ? :back : options[:path]
  end
end
