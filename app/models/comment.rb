# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text             default(""), not null
#  user_id          :bigint           not null
#  commentable_type :string
#  commentable_id   :bigint
#  delete_at        :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :commentable, polymorphic: true, dependent: :destroy

  # TODO: remove body field
  # validates :body, presence: true, length: { maximum: 1000 }

  has_rich_text :message
end
