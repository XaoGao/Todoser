require 'rails_helper'

RSpec.describe Favorites::FindFavoriteableService do
  subject(:service) { described_class.new }

  describe ".call!" do
    let(:task) { create(:task) }

    it "success find a task" do
      result = subject.call!(task.class.to_s, task.id)
      got = Result.new(true, task, nil)
      expect(result.data).to eq(got.data)
      expect(result.status).to eq(got.status)
    end

    it "unknown type" do
      expect { service.call!("unknown type", 1) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
