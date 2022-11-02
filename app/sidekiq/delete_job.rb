class DeleteJob
  include AutoInject["tasks_repository"]
  include Sidekiq::Job

  def perform
    tasks_repository.destroy_deleted
  end
end
