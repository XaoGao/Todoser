FactoryBot.define do
  factory :notification do
    body { Faker::Lorem.sentence(word_count: 3) }
    read_at { nil }
    association factory: :user
  end
end
