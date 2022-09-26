# frozen_string_literal: true

class Button::AddComponent < Button::BaseComponent
  def initialize(options = {})
    label = options[:label] || ""
    icon = options[:icon] || "fa-solid fa-plus"
    title = options[:title] || I18n.t("button.add")
    super(options.merge(label: label, icon: icon, title: title))
  end

  def default_classes
    "btn btn-primary"
  end
end
