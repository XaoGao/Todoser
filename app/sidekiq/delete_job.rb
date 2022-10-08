class DeleteJob
  include Sidekiq::Job

  def perform
    Task.where.not(delete_at: nil).destroy_all
  end
end
