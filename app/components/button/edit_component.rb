# frozen_string_literal: true

class Button::EditComponent < Button::BaseComponent
  def initialize(path, option = {})
    super("", path, option.merge(icon: "fa-solid fa-pen-to-square", title: I18n.t("button.edit")))
  end

  def default_classes
    "btn btn-success"
  end
end
