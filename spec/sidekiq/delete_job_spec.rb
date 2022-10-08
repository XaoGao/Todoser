require 'rails_helper'

RSpec.describe DeleteJob, type: :job do
  subject(:job) { described_class.new }

  describe ".perform" do
    it "destroy tasks" do
      create_list(:task, 3, delete_at: DateTime.now)
      create_list(:task, 2, delete_at: nil)

      job.perform

      expect(Task.all.count).to eq(2)
    end
  end
end
