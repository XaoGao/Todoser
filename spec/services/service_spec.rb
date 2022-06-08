require 'rails_helper'

RSpec.describe Service do
  let(:service) { described_class.new }

  describe ".success" do
    it { expect(service.success("test data").class).to eq(Result) }
  end

  describe ".failure" do
    it { expect(service.failure("test data").class).to eq(Result) }
  end
end
