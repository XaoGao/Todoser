# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  describle  :text             default("")
#  status     :integer          default(0), not null
#  author_id  :integer          not null
#  project_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  delete_at  :datetime
#
class Task < ApplicationRecord
  include Lockable

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :project

  belongs_to :executor, class_name: "User", foreign_key: "executor_id"

  enum status: [:selected, :doing, :done, :release, :archive]
  enum priority: [:lowest, :low, :medium, :high, :highest]

  # TODO: replace to view component
  class << self
    def statuses_for_list
      statuses.except(:archive)
    end
  end
end
