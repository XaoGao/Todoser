# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :project do
    title { Faker::Company.name }
    association :user
  end
end
