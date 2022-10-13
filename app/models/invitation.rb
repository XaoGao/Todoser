# == Schema Information
#
# Table name: invitations
#
#  id           :bigint           not null, primary key
#  recipient_id :bigint           not null
#  agree        :boolean
#  delete_at    :datetime
#  sender_id    :bigint           not null
#  project_id   :bigint           not null
#  token        :string           default(""), not null
#
class Invitation < ApplicationRecord
  belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :project

  validates :token, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 19 }
end
