require 'rails_helper'

RSpec.describe Notifications::NotificationsRepository, type: :repository do
  subject(:repository) { described_class.new }

  describe ".last" do
    let(:user) { create(:user) }
    let!(:notifications) { create_list(:notification, 4, recipient: user) }

    it "return 3 notifications" do
      expect(repository.last(user).count).to eq(3)
    end
  end
end
