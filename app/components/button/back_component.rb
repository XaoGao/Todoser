# frozen_string_literal: true

class Button::BackComponent < Button::BaseComponent
  def initialize(option = {})
    super(I18n.t("button.back"), back_path(option), option.merge(icon: "fa-solid fa-arrow-left-long"))
  end

  def default_classes
    "btn btn-primary"
  end

  def back_path(option)
    option[:path].nil? ? :back : option[:path]
  end
end
