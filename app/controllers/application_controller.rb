class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include NotFoundHandler
  include Unauthorized
  include Authentication
  include Resulteable
  include Localeable

  protected

  def configure_permitted_parameters
    attributes = %i[username first_name last_name avatar locale]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:sign_in, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
