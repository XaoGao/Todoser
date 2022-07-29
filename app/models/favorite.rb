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
class Favorite < ApplicationRecord
  include Lockable

  belongs_to :user, dependent: :destroy
  belongs_to :favoriteable, polymorphic: true, dependent: :destroy

  # TODO: add validates like:
  # validates :user_id, uniqueness: { scope: [:favoriteable_id, :favoriteable_type]}
end
