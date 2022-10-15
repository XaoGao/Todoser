require 'rails_helper'

RSpec.describe Invitations::InvitationConfirmService do
  subject(:service) { described_class.new }

  describe ".call" do
    let(:recipient) { create(:user) }
    let(:project) { create(:project) }
    let(:invitation) { create(:invitation, recipient: recipient, project: project) }

    before do
      service.call(invitation)
    end

    it "confirmed invitation" do
      expect(invitation.agree).to be true
    end

    it "created project member" do
      expect(ProjectMember.find_by(user: recipient, project: project)).not_to be_nil
    end
  end
end
