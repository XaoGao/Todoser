require 'rails_helper'

RSpec.describe ProjectMarks::EditTitleProjectMarkService do
  subject(:service) { described_class.new }

  describe ".call" do
    let(:project) { create(:project) }
    let(:mark) { create(:mark) }

    context "when project mark is exist" do
      let!(:project_mark) { create(:project_mark, mark: mark, project: project, title: "some text") }

      it "success updated title" do
        result = service.call(project, mark, "second text")
        expect(result.success?).to be true
        expect(ProjectMark.find(project_mark.id).title).to eq("second text")
      end
    end

    context "when failed service" do
      it "project mark is not found" do
        result = service.call(project, mark, "second text")
        expect(result.success?).to be false
        expect(result.error_messages).to eq(I18n.t("errors.not_found"))
      end

      it "same text" do
        create(:project_mark, mark: mark, project: project, title: "some text")
        result = service.call(project, mark, "some text")
        expect(result.success?).to be false
        expect(result.error_messages).to eq("same text?")
      end
    end
  end
end
