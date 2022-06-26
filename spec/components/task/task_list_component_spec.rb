require "rails_helper"

RSpec.describe Task::TaskListComponent, type: :component do
  let(:project) { build(:project) }
  let(:user) { build(:user) }
  subject(:task_list) { described_class.new(project, user) }

  describe "#statuses_for_list" do
    it { expect(task_list.statuses_for_list).to eq({ "selected" => 0, "doing" => 1, "done" => 2, "release" => 3 }) }
  end
end
