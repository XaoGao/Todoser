# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  title       :string           default(""), not null
#  status      :integer          default("selected"), not null
#  author_id   :bigint           not null
#  project_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  delete_at   :datetime
#  position    :integer          default(0), not null
#  priority    :integer          default("lowest"), not null
#  executor_id :bigint
#
FactoryBot.define do
  factory :task do
    title { Faker::App.name }
    description { Faker::Lorem.paragraph }
    status { 0 }
    association :author, factory: :user
    association :project
  end
end
