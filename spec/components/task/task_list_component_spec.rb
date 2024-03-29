require "rails_helper"

RSpec.describe Task::TaskListComponent, type: :component do
  subject(:task_list) { described_class.new(project: project, tasks: nil) }

  let(:project) { build(:project) }

  describe "#statuses_for_list" do
    it { expect(task_list.statuses_for_list).to eq({ "selected" => 0, "doing" => 1, "done" => 2, "release" => 3 }) }
  end
end
