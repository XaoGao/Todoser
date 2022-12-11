require "rails_helper"

RSpec.describe Jobs::JobsToggleService, type: :service do
  subject(:service) { described_class.new(jobs_repository: jobs_repository) }

  let(:jobs_repository) { double("jobs_repository", find: job) }
  let(:job) do 
    double("First sidekiq job", name: "First name job",
      status: "enabled",
      cron: "* * * * *",
      last_enqueue_time: Time.now,
      klass: "Some class",
      enque!: true,
      disable!: true)
  end

  describe ".call" do
    it { expect(service.call("First name job").success?).to be true }
    it { expect(service.call("First name job").data).to be_instance_of(SidekiqJobAdapter) }
  end
end
