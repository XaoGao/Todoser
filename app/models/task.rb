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
end
