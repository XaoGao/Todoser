require 'rails_helper'

RSpec.describe ProjectsHelper, type: :helper do
  describe ".project_description_placeholder" do
    let(:project_with_description) { build(:project) }
    let(:project_without_description) { build(:project, description: "") }

    it { expect(project_description_placeholder(project_with_description)).to eq(project_with_description.description) }
    it do
      expect(project_description_placeholder(project_without_description)).to eq(t("projects.show.description_placeholder"))
    end
  end
end
