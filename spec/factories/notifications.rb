# == Schema Information
#
# Table name: notifications
#
#  id         :integer         not null, primary key
#  body       :string          not null
#  read_at    :datetime        default: nil
#
FactoryBot.define do
  factory :notification do
    body { Faker::Lorem.sentence(word_count: 3) }
    read_at { nil }
    association factory: :user
  end
end
