# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validates :title, presence: true, length: { in: 2..100 }
end
