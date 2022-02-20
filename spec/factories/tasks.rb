FactoryBot.define do
  factory :task do
    title { Faker::App.name }
    describle { Faker::Lorem.paragraph }
    status { 0 }
    association :user
    association :project
  end
end
