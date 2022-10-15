require 'rails_helper'

RSpec.describe Invitations::InvitationCreateService do
  subject(:service) { described_class.new }

  describe ".call" do
    let(:sender) { create(:user) }
    let(:recipient) { create(:user) }
    let(:project) { create(:project) }

    it "user is not found" do
      result = service.call("fake email", sender, project)
      expect(result.success?).to be false
      expect(result.error_messages).to eq(I18n.t("invitations.create.user_not_found"))
    end

    it "success created" do
      result = service.call(recipient.email, sender, project)
      expect(result.success?).to be true
      expect(result.data).to eq(I18n.t("invitations.create.success", username: recipient.full_name))
    end
  end
end
