# == Schema Information
#
# Table name: invitations
#
#  id           :bigint           not null, primary key
#  recipient_id :bigint           not null
#  agree        :boolean
#  delete_at    :datetime
#  project_id   :bigint
#  consumer_id  :bigint
#
class Invitation < ApplicationRecord
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :project
  belongs_to :consumer, class_name: 'User'
end
