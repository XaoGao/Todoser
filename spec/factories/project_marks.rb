# == Schema Information
#
# Table name: project_marks
#
#  id         :bigint           not null, primary key
#  mark_id    :bigint           not null
#  project_id :bigint           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :project_mark do
    association :project
    association :mark
    title { Faker::Lorem.sentence(word_count: 2) }
  end
end
