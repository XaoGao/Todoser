require 'rails_helper'

RSpec.describe Projects::CreateProjectService do
  subject(:service) { described_class.new }

  describe ".call" do
    let(:project) { build(:project) }
    let(:user) { create(:user) }

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
end
