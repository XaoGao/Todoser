module NotFoundHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found(exception)
      logger.warn exception
      flash[:alert] = t("errors.not_found")
      redirect_to root_path
    end
  end
end
