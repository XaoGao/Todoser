# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  delete_at   :datetime
#  short_title :string           default("")
#  status      :integer
#
class Project < ApplicationRecord
  include Lockable

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :tasks

  has_many :project_members
  has_many :members, through: :project_members, class_name: "User", foreign_key: "user_id", source: :user

  has_many :project_marks
  has_many :marks, through: :project_marks

  enum status: [:active, :archive, :removed]

  validates :title, presence: true, length: { in: 2..100 }

  has_rich_text :description

  #  TODO: replace to view component
  def member_to_select
    members.collect { |u| [u.email, u.id] }
  end

  def tasks_list_of(task_status)
    tasks.public_send(task_status).order("position")
  end
end
