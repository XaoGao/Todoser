require 'rails_helper'

RSpec.describe Notifications::NotificationLastService do
  subject(:service) { described_class.new(notifications_repository: notifications_repository) }

  let(:notifications_repository) { double("notifications_repository", last: notifications) }
  let(:notifications) { create_list(:notification, 3) }

  let(:recipient) { create(:user) }

  describe ".call" do
    context "when success result" do
      it { expect(service.call(recipient).success?).to be(true) }
    end
  end
end
