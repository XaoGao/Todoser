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
require 'rails_helper'

RSpec.describe Invitation, type: :model do
end
