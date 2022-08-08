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
require 'rails_helper'

RSpec.describe Invitation, type: :model do
end
