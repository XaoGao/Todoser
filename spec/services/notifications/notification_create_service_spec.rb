require 'rails_helper'

RSpec.describe Notifications::NotificationCreateService do
  subject(:service) { described_class.new }

  describe ".call" do
    let(:sender) { create(:user) }
    let(:recipient) { create(:user) }

    it "creates a new notification" do
      result = service.call(sender, recipient, "Sample message")
      expect(result.success?).to be true
    end

    it "fails with empty message" do
      result = service.call(sender, recipient, "")
      expect(result.error_messages).to eq I18n.t("notifications.errors.empty_message")
    end

    it "fails if user is deleted" do
      recipient.update(delete_at: DateTime.now - 1.hour)
      result = service.call(sender, recipient, "Sample message")
      expect(result.error_messages).to eq I18n.t("notifications.errors.deleted_user")
    end
  end
end
