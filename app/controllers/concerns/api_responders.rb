module ApiResponders
  extend ActiveSupport::Concern

  def unauthorized(message)
    render status: :unauthorized, json: { error: message }
  end

  def bad_request(message)
    render status: :bad_request, json: { error: message }
  end

  def ok(obj = {})
    render status: :ok, json: obj
  end
end
