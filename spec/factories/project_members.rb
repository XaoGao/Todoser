# == Schema Information
#
# Table name: project_members
#
#  id         :bigint           not null, primary key
#  project_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :project_member do
    association :project
    association :user
  end
end
