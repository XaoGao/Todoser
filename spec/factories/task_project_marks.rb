# == Schema Information
#
# Table name: task_project_marks
#
#  id              :bigint           not null, primary key
#  project_mark_id :bigint           not null
#  task_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :task_project_mark do
    association :project_mark
    association :task
  end
end
