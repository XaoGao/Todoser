require 'rails_helper'

RSpec.describe SomeJob, type: :job do
  describe ".perform" do
    it { expect(described_class.new.perform).to eq(1) }
  end
end
