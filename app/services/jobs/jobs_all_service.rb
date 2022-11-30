module Jobs
  class JobsAllService < Service
    include AutoInject["jobs_repository"]

    def call
      jobs = jobs_repository.all.map do |job|
        ::SidekiqJobAdapter.new(sidekiq_job: job)
      end

      success(jobs)
    end
  end
end
