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
FactoryBot.define do
  factory :invitation do
    agree { nil }
    delete_at { nil }
    association :recipient, factory: :user
  end
end
