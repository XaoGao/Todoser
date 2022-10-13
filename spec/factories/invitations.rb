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
FactoryBot.define do
  factory :invitation do
    agree { nil }
    token { SecureRandom.hex(10) }
    delete_at { nil }
    association :recipient, factory: :user
    association :sender, factory: :user
  end
end
