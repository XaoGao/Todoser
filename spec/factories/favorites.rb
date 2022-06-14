# == Schema Information
#
# Table name: favorites
#
#  id                :bigint           not null, primary key
#  user_id           :bigint           not null
#  favoriteable_type :string
#  favoriteable_id   :bigint
#  delete_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :favorite do
    association :user
    association :favoriteable, factory: :task
    delete_at { nil }
  end
end
