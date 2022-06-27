# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           default(""), not null
#  online                 :boolean          default(FALSE)
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, foreign_key: "author_id"
  has_many :tasks

  has_many :project_members
  has_many :member_in_project, through: :project_members, class_name: "Project", foreign_key: "project_id",
                               source: :project

  has_many :favorites
  has_many :favorites_tasks, through: :favorites, source: :favoriteable, source_type: "Task"

  validates :first_name, presence: true, length: { in: 2..100 }
  validates :last_name, presence: true, length: { in: 2..100 }
  validates :username, presence: true, length: { in: 2..100 }

  def active_favorites
    favorites.where(delete_at: nil)
  end

  def active_favorites_tasks
    favorites_tasks.where(delete_at: nil)
  end

  def full_name
    [first_name, last_name].compact.join(" ")
  end

  def enable?
    true
    # TODO: implements after add delete_at field to users model
  end
end
