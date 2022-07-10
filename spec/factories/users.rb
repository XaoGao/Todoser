# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           default(""), not null
#  online                 :boolean          default(FALSE)
#  locale                 :string           default("en"), not null
#
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    username { "@#{Faker::Internet.username}" }
    email { Faker::Internet.email }
    password { "password" }
    online { false }
    locale { "en" }

    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new("spec/support/assets/test_image.png", "image/png") }
    end
  end
end
