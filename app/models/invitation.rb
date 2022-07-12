# == Schema Information
#
# Table name: invitations
#
#  id           :bigint           not null, primary key
#  recipient_id :bigint           not null
#  agree        :boolean
#  delete_at    :datetime
#
class Invitation < ApplicationRecord
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
end
