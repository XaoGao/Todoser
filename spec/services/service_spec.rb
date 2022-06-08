require 'rails_helper'

RSpec.describe Service do
  let(:service) { described_class.new }

  describe ".success" do
    let(:result) { service.success("test data") }
    it { expect(result.class).to eq(Result) }
  end

  describe ".failure" do
    let(:result) { service.failure("test data") }
    it { expect(result.class).to eq(Result) }
  end
end
