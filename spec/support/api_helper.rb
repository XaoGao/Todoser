module ApiHelpers
  def json_response
    JSON.parse(response.body)
  end

  def authorization_header(token)
    request.headers["Authorization"] = "Bearer #{token}"
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :controller
end
