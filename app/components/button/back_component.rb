# frozen_string_literal: true

class Button::BackComponent < Button::BaseComponent
  def initialize(path, option = {})
    add_default_css_class(option)
    super(I18n.t("button.back"), path, option.merge(icon: "fa-solid fa-arrow-left-long"))
  end

  private

  def add_default_css_class(option)
    if option[:class].nil?
      option[:class] = "btn btn-primary"
    else
      option[:class] = "#{option[:class]} btn btn-primary"
    end
  end
end
