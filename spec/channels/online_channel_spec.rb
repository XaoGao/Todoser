require "rails_helper"

RSpec.describe OnlineChannel, type: :channel do
  let(:user) { create(:user, online: false) }

  before do
    stub_connection(current_user: user)
  end

  it "successfully connects" do
    subscribe
    expect(subscription).to be_confirmed
    expect(user.online).to be true
  end

  it "successfully disconnects" do
    subscribe
    unsubscribe
    expect(user.online).to be false
  end
end
