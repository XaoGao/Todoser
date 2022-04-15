# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  describle  :text             default("")
#  status     :integer          default(0), not null
#  author_id  :integer          not null
#  project_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  delete_at  :datetime
#
FactoryBot.define do
  factory :task do
    title { Faker::App.name }
    describle { Faker::Lorem.paragraph }
    status { 0 }
    association :author, factory: :user
    association :project
  end
end
