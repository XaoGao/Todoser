# == Schema Information
#
# Table name: project_marks
#
#  id         :bigint           not null, primary key
#  mark_id    :bigint           not null
#  project_id :bigint           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProjectMark < ApplicationRecord
  belongs_to :project
  belongs_to :mark

  validates :title, length: { maximum: 50 }

  # TODO: replace to view component or helper
  def present_title
    title.nil? ? "-" : title.capitalize
  end
end
