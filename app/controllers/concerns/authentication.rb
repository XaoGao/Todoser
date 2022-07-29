module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authentication
  end

  def authentication
    if user_signed_in?
      Current.user = current_user
    else
      Current.user = nil
    end
  end
end
