module Jobs
  class JobsToggleService < Service
    include AutoInject["jobs_repository"]

    def call(name)
      job = jobs_repository.find name
      if job.status == "enabled"
        job.disable!
      else
        job.enable!
      end

      success(::SidekiqJobAdapter.new(sidekiq_job: job))
    end
  end
end
