# frozen_string_literal: true

class Jobs::JobComponent < ViewComponent::Base
  attr_reader :job

  def initialize(job:)
    @job = job
  end

  def status_class
    status = enabled? ? "success" : "danger"
    "badge badge-#{status}"
  end

  def toggle_status
    (enabled? ? "disable" : "enable").capitalize
  end

  delegate :last_enqueue_time, :status, to: :job

  private

  def enabled?
    job.status == "enabled"
  end
end
