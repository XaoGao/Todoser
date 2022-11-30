module Jobs
  class JobsLaunchService < Service
    include AutoInject["jobs_repository"]

    def call(name)
      job = jobs_repository.find(name)
      job.enque!

      success(::SidekiqJobAdapter.new(sidekiq_job: job))
    end
  end
end
