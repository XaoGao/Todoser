require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe ".read" do
    let(:notification) { create(:notification, read_at: nil) }

    it "read is not nil" do
      notification.read
      expect(notification.read_at).not_to be_nil
    end
  end
end
