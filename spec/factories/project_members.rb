# == Schema Information
#
# Table name: project_members
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :project_member do
    association :project
    association :user
  end
end
