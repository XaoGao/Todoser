# frozen_string_literal: true

class General::FooterComponent < ViewComponent::Base
  def current_year
    DateTime.now.year
  end
end
