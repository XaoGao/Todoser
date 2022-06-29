module ApiHelpers
  def json_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config| 
  config.include ApiHelpers, type: :controller
end
