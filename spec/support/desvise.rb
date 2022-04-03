require_relative './devise_request_spec_helper'

RSpec.configure do |config|
  config.include DeviseRequestSpecHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :controller
end
