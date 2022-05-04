# frozen_string_literal: true

class Button::BackComponent < Button::BaseComponent
  def initialize(path, option)
    super(I18n.t("button.back"), path, option.merge(icon: "fa-solid fa-arrow-left-long"))
  end
end
