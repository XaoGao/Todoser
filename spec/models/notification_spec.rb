require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe ".read_at" do
    let(:notification) { create(:notification, read_at: nil) }

    it "read is not nil" do

      expect(notification.read_at).to not_nil
    end
  end
end
