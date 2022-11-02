require 'rails_helper'

RSpec.describe Projects::CreateProjectService do
  describe ".call" do
    subject(:service) { described_class.new(
      create_project_member_service: create_project_member_service,
      project_marks_repository: project_marks_repository)
    }

    let(:project) { build(:project) }
    let(:user) { create(:user) }

    let(:project_marks_repository) { double("project_marks_repository", create_for: nil) }

    context "when a success result" do
      let(:project_member) { create(:project_member, user: user, project: project) }
      let(:create_project_member_service) { double("create_project_member_service",
        failure?: false,
        call: Result.new(true, project_member, nil))
      }

      before do
        service.call project, user
      end

      it "create a new project with member" do
        expect(Project.count).to eq(1)
      end

      it "create member for author the project" do
        expect(ProjectMember.find_by(user: user, project: project)).not_to be_nil
      end
    end

    context "when a exceptions" do
      let(:create_project_member_service) { double("create_project_member_service") }

      before do
        allow(create_project_member_service).to receive(:call).and_raise("test message")
      end

      it "failure result" do
        result = service.call project, user
        expect(result.success?).to be false
      end

      it "failure message" do
        result = service.call project, user
        expect(result.error_messages).to eq(I18n.t("errors.unexpected_error"))
      end
    end
  end
end
