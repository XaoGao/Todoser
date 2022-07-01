module ApiResponders
  extend ActiveSupport::Concern

  private

  def unauthorized(message)
    render status: :unauthorized, json: { error: t(message) }
  end

  def bad_request(message)
    render status: :bad_request, json: { error: t(message) }
  end

  def ok(obj = {})
    render status: :ok, json: obj
  end
end
