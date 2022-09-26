# frozen_string_literal: true

class Button::EditComponent < Button::BaseComponent
  def initialize(options = {})
    label = options[:label] || ""
    icon = options[:icon] || "fa-solid fa-pen-to-square"
    title = options[:title] || I18n.t("button.edit")
    super(options.merge(label: label, icon: icon, title: title))
  end

  def default_classes
    "btn btn-success"
  end
end
