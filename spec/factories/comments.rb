FactoryBot.define do
  factory :comment do
    body { "MyText" }
    delete_at { "2022-06-11 10:23:15" }
    user { nil }
    commentable { nil }
  end
end
