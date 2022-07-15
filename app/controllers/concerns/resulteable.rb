module Resulteable
  extend ActiveSupport::Concern

  def flash_service_result(result)
    if result.success?
      flash[:notice] = result.data
    else
      flash[:alert] = result.error_messages
    end
  end
end
