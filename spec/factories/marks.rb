# == Schema Information
#
# Table name: marks
#
#  id    :bigint           not null, primary key
#  color :string           not null
#
FactoryBot.define do
  factory :mark do
    color { %w[#00d600 #ffde24 #ffb224 #ff5252 #b452ff #24ffff].sample }
  end
end