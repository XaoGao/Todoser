module Localeable
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  private

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.locale
    else
      I18n.locale = I18n.default_locale
     end
  end
end
