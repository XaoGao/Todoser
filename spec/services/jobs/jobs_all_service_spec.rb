require "rails_helper"

RSpec.describe Jobs::JobsAllService, type: :service do
  subject(:service) { described_class.new(jobs_repository: jobs_repository) }

  let(:jobs_repository) { double("jobs_repository", all: jobs) }
  let(:jobs) do 
    dbl1 = double("First sidekiq job", name: "First name job",
      status: "enabled",
      cron: "* * * * *",
      last_enqueue_time: Time.now,
      klass: "Some class")
    dbl2 = double("Second sidekiq job", name: "Second name job",
      status: "enabled",
      cron: "* * * * *",
      last_enqueue_time: Time.now,
      klass: "Some class")
    [dbl1, dbl2]
  end

  describe ".call" do
    it { expect(service.call.success?).to be true }
    it { expect(service.call.data.first).to be_instance_of(SidekiqJobAdapter) }
    it { expect(service.call.data.first.name).to eq("First name job") }
  end
end
