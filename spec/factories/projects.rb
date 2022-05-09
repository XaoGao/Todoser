# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  delete_at   :datetime
#  short_title :string           default("")
#  status      :integer
#
FactoryBot.define do
  factory :project do
    title { Faker::Company.name }
    short_title { title }
    description { Faker::Lorem.sentence(word_count: 5) }
    delete_at { nil }
    association :author, factory: :user
  end
end
