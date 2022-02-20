# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".full_name" do
    let(:user) { build(:user, first_name: "Joe", last_name: "Doe") }
    it { expect(user.full_name).to eq("Joe Doe") }
  end
end
