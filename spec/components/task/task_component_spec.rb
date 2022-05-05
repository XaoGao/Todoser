require "rails_helper"

RSpec.describe Task::TaskComponent, type: :component do
  describe ".dom_id" do
    let(:project) { create(:project) }
    let(:task) { create(:task, project: project) }
    subject(:task_component) { described_class.new(project, task) }
    it { expect(task_component.dom_id).to eq("task-#{task.id}") }
  end
end
