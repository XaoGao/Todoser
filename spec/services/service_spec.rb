require 'rails_helper'

RSpec.describe Service do
  describe "success" do
    # service = Service.new
    # expect(service.success("test data").to_a).to eq(Result)
    # - мы проверям просто что метод возврщает именно Result
    it 'success is true' do
      service = Service.new # (true, data, nil)
      # expect(service.success("test data").to_a).to eq(Result)
      expect(service.success("test data") == Result)
    end
  end

  describe "failure" do
    it 'failure is true' do
      # ArgumentError:
      #  wrong number of arguments (given 3, expected 0)
      service = Service.new # (false, "some data", "error messages")
      expect(service.failure("error messages", nil)) == (Result)
    end
  end
end
