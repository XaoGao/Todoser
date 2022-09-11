# frozen_string_literal: true

class Button::DeleteComponent < Button::BaseComponent
  def initialize(options = {})
    label = options[:label] || ""
    icon = options[:icon] || "fa-solid fa-trash"
    title = options[:title] || I18n.t("button.delete")
    super(options.merge(label: label, icon: icon, title: title, method: :delete))
  end

  def default_classes
    "btn btn-danger"
  end
end
