# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string           default(""), not null
#  status      :integer          default("selected"), not null
#  author_id   :integer          not null
#  project_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  delete_at   :datetime
#  position    :integer          default(0), not null
#  priority    :integer          default("lowest"), not null
#  executor_id :integer
#
class Task < ApplicationRecord
  include Lockable

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :project

  belongs_to :executor, class_name: "User", foreign_key: "executor_id", optional: true

  has_many :comments, as: :commentable
  has_many :favorites, as: :favoriteable

  enum status: [:selected, :doing, :done, :release, :archive]
  enum priority: [:lowest, :low, :medium, :high, :highest]

  has_many :task_project_marks
  has_many :project_marks, through: :task_project_marks

  has_rich_text :description
end
