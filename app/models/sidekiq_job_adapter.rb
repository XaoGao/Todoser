class SidekiqJobAdapter
  include ActiveModel::Model

  attr_accessor :sidekiq_job

  validates :sidekiq_job, presence: true

  delegate :name, :klass, :cron, :last_enqueue_time, :status, to: :sidekiq_job
end
