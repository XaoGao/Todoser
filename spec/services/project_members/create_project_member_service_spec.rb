require 'rails_helper'

RSpec.describe ProjectMembers::CreateProjectMemberService do
  subject(:service) { described_class.new }

  describe ".call" do
    let(:user) { create(:user) }
    let(:project) { create(:project) }

    context "when a success result" do
      it "success status" do
        result = service.call(project, user)
        expect(result.success?).to be true
      end

      it "created a project member record" do
        service.call(project, user)
        expect(ProjectMember.find_by(user: user, project: project)).not_to be_nil
      end
    end

    context "when a failure result" do
      let(:user) { nil }

      it "failure status" do
        result = service.call(project, user)
        expect(result.success?).to be false
      end

      it "failure messages" do
        result = service.call(project, user)
        expect(result.error_messages).to eq(["User must exist"])
      end
    end
  end
end
