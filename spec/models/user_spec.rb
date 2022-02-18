require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".full_name" do
    let(:user) { build(:user, first_name: "Joe", last_name: "Doe") }
    it { expect(user.full_name).to eq("Joe Doe") }
  end
end
