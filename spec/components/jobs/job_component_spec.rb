# frozen_string_literal: true

require "rails_helper"

RSpec.describe Jobs::JobComponent, type: :component do
  let(:job_enabled) do 
    dbl = double("Some sidekiq job")
    allow(dbl).to receive_messages(name: "name job",
      status: "enabled",
      cron: "* * * * *",
      last_enqueue_time: Time.now,
      klass: "Some class")
    dbl
  end

  let(:job_disabled) do 
    dbl = double("Some sidekiq job")
    allow(dbl).to receive_messages(name: "name job",
      status: "disabled",
      cron: "* * * * *",
      last_enqueue_time: Time.now,
      klass: "Some class")
    dbl
  end

  describe ".status_class" do
    it { expect(described_class.new(job: job_enabled).status_class).to eq("badge badge-success") }
    it { expect(described_class.new(job: job_disabled).status_class).to eq("badge badge-danger") }
  end

  describe ".toggle_status" do
    it { expect(described_class.new(job: job_enabled).toggle_status).to eq("Disable") }
    it { expect(described_class.new(job: job_disabled).toggle_status).to eq("Enable") }
  end

  it "renders job" do
    render_inline(described_class.new(job: job_enabled))

    expect(page).to have_text("Some class")
  end
end
