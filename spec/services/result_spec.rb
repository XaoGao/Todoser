require 'rails_helper'

RSpec.describe Result do
  describe ".success?" do
    it 'succes is true' do
      result = Result.new(true, "some data", "some error")
      expect(result.success?).to be true
    end

    it 'succes is false' do
      result = Result.new(false, "some data", "some error")
      expect(result.success?).to be false
    end

    it 'success isn\'t be nil' do
      result = Result.new(!nil, "some data", "some error")
      expect(result.failure?).to_not be_nil
    end
  end

  describe ".failure?" do
    it 'failure is true' do
      result = Result.new(true, "some data", "some error")
      expect(result.failure?).to be false # !true
    end

    it 'failure is false' do
      result = Result.new(false, "some data", "some error")
      expect(result.failure?).to be true # !false
    end

    it 'failure is be nil' do
      result = Result.new(nil, "some data", "some error")
      expect(result.failure?).to_not be_nil
    end
  end
end