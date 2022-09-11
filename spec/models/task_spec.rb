# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  title       :string           default(""), not null
#  status      :integer          default("selected"), not null
#  author_id   :bigint           not null
#  project_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  delete_at   :datetime
#  position    :integer          default(0), not null
#  priority    :integer          default("lowest"), not null
#  executor_id :bigint
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe ".executor_name" do
    let(:user) { create(:user) }
    let(:task) { build(:task, executor: user) }
    let(:task_without_executor) { build(:task, executor: nil) }

    it "executor is exist" do
      expect(task.executor_name).to eq(user.full_name)
    end

    it "executor is empty" do
      expect(task_without_executor.executor_name).to eq("-")
    end
  end
end
