module Jobs
  class JobsRepository
    def all
      Sidekiq::Cron::Job.all
    end

    def find(name)
      Sidekiq::Cron::Job.find name
    end
  end
end
