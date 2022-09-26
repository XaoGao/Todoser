module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def base_button(args)
    Button::BaseComponent.new(args)
  end

  def add_button(args)
    Button::AddComponent.new(args)
  end

  def back_button(args = {})
    Button::BackComponent.new(args)
  end

  def edit_button(args)
    Button::EditComponent.new(args)
  end

  def delete_button(args)
    Button::DeleteComponent.new(args)
  end
end
