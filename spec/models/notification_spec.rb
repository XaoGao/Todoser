# == Schema Information
#
# Table name: notifications
#
#  id           :bigint           not null, primary key
#  sender_id    :bigint           not null
#  recipient_id :bigint           not null
#  body         :string           default(""), not null
#  read_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
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
