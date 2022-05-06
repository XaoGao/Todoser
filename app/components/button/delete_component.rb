# frozen_string_literal: true

class Button::DeleteComponent < Button::BaseComponent
  def initialize(path, option = {})
    super("", path, option.merge(icon: "fa-solid fa-trash", title: I18n.t("button.delete"), method: :delete))
  end

  def default_classes
    "btn btn-danger"
  end
end
