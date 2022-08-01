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
class TaskProjectMark < ApplicationRecord
  belongs_to :project_mark
  belongs_to :task
end
