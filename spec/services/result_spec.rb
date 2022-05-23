require 'rails_helper'

RSpec.describe Result do
  describe ".success?" do
    it 'succes is true' do
      result = Result.new(true, "some data", "some error")
      expect(result.success?).to be true
    end
  end

  describe ".success?" do
    it 'succes is false' do
      result = Result.new(false, "some data", "some error")
      expect(result.success?).to be false
    end
  end

  describe ".failure?" do
    it 'failure is true' do
      result = Result.new(true, "some data", "some error")
      expect(result.failure?).to be false # !true
    end
  end

  describe ".failure?" do
    it 'failure is false' do
      result = Result.new(false, "some data", "some error")
      expect(result.failure?).to be true # !false
    end
  end
end
