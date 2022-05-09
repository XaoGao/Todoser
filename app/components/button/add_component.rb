# frozen_string_literal: true

class Button::AddComponent < Button::BaseComponent
  def initialize(path, option = {})
    super("", path, option.merge(icon: "fa-solid fa-plus", title: I18n.t("button.add")))
  end

  def default_classes
    "btn btn-primary"
  end
end
