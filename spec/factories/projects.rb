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
#  description :text             default("")
#  short_title :string           default("")
#  status      :integer
#
FactoryBot.define do
  factory :project do
    title { Faker::Company.name }
    description { Faker::Lorem.sentence(word_count: 5) }
    short_title { title }
    delete_at { nil }
    association :author, factory: :user
  end
end
