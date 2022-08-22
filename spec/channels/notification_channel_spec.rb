require 'rails_helper'

RSpec.describe NotificationChannel, type: :channel do
  let(:user) { create(:user, online: false) }

  before do
    stub_connection(current_user: user)
  end

  it "successfully connects" do
    subscribe
    expect(subscription).to be_confirmed
  end

  it "successfully disconnects" do
    subscribe
    unsubscribe
  end
end
