FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence(word_count: 50) }
    delete_at { nil }
    association factory: :user
  end
end
