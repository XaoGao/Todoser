require "rails_helper"

RSpec.describe Project::CardComponent, type: :component do
  subject(:card) { described_class.new(project: project, task: task) }

  let(:project) { create(:project) }
  let(:task) { create(:task, project: project) }

  describe ".project_description_placeholder" do
    context "with description" do
      let(:project) { build(:project) }

      it do
        expect(card.project_description_placeholder).to eq(project.description)
      end
    end

    context "without description" do
      let(:project) { build(:project, description: "") }

      it do
        expect(card.project_description_placeholder).to eq(I18n.t("projects.show.description_placeholder"))
      end
    end
  end
end
