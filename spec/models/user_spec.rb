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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".full_name" do
    let(:user) { build(:user, first_name: "Joe", last_name: "Doe") }
    it { expect(user.full_name).to eq("Joe Doe") }
  end

  describe ".active_favorites" do
    let(:user) { create(:user) }
    let(:tasks) { create_list(:task, 3) }

    before(:each) do
      tasks.each do |task|
        Favorite.create(user: user, favoriteable: task)
      end
      Favorite.last.update(delete_at: DateTime.now)
    end

    it "return only active favorite" do
      expect(user.active_favorites.count).to eq(2)
    end
  end
end
