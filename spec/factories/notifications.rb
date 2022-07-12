# == Schema Information
#
# Table name: notifications
#
#  id           :bigint           not null, primary key
#  sender_id    :bigint           not null
#  recipient_id :bigint           not null
#  body         :string           default(""), not null
#  read_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :notification do
    body { Faker::Lorem.sentence(word_count: 3) }
    read_at { nil }
    association :sender, factory: :user
    association :recipient, factory: :user
  end
end
