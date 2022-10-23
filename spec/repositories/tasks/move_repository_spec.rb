require 'rails_helper'

RSpec.describe Tasks::MoveRepository, type: :repository do
  subject(:repository) { described_class.new }

  let(:project) { create(:project) }

  describe ".from" do
    let!(:task_1) { create(:task, project: project, status: Task.statuses[:doing], position: 1) }
    let!(:task_2) { create(:task, project: project, status: Task.statuses[:doing], position: 2) }
    let!(:task_3) { create(:task, project: project, status: Task.statuses[:doing], position: 3) }
    let!(:task_4) { create(:task, project: project, status: Task.statuses[:doing], position: 4) }

    it "move first task" do
      repository.from(task_1)
      expect(task_2.reload.position).to eq(1)
      expect(task_3.reload.position).to eq(2)
      expect(task_4.reload.position).to eq(3)
    end

    it "move second task" do
      repository.from(task_2)
      expect(task_1.reload.position).to eq(1)
      expect(task_3.reload.position).to eq(2)
      expect(task_4.reload.position).to eq(3)
    end

    it "move thrid task" do
      repository.from(task_3)
      expect(task_1.reload.position).to eq(1)
      expect(task_2.reload.position).to eq(2)
      expect(task_4.reload.position).to eq(3)
    end

    it "move last task" do
      repository.from(task_4)
      expect(task_1.reload.position).to eq(1)
      expect(task_2.reload.position).to eq(2)
      expect(task_3.reload.position).to eq(3)
    end
  end

  describe ".to" do
    let!(:task_1) { create(:task, project: project, status: Task.statuses[:selected], position: 1) }
    let!(:task_2) { create(:task, project: project, status: Task.statuses[:doing], position: 2) }
    let!(:task_3) { create(:task, project: project, status: Task.statuses[:doing], position: 3) }
    let!(:task_4) { create(:task, project: project, status: Task.statuses[:doing], position: 4) }

    it "move first task" do
      repository.to(task_1, :doing, 1)
      expect(task_2.reload.position).to eq(3)
      expect(task_3.reload.position).to eq(4)
      expect(task_4.reload.position).to eq(5)
    end

    it "move second task" do
      repository.to(task_1, :doing, 2)
      expect(task_2.reload.position).to eq(3)
      expect(task_3.reload.position).to eq(4)
      expect(task_4.reload.position).to eq(5)
    end

    it "move thrid task" do
      repository.to(task_1, :doing, 3)
      expect(task_2.reload.position).to eq(2)
      expect(task_3.reload.position).to eq(4)
      expect(task_4.reload.position).to eq(5)
    end

    it "move last task" do
      repository.to(task_1, :doing, 4)
      expect(task_2.reload.position).to eq(2)
      expect(task_3.reload.position).to eq(3)
      expect(task_4.reload.position).to eq(5)
    end
  end
end
