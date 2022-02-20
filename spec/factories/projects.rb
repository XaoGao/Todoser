FactoryBot.define do
  factory :project do
    title { Faker::Company.name }
    association :user
  end
end
