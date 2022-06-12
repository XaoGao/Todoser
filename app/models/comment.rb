class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :commentable, polymorphic: true, dependent: :destroy

  validates :body, presence: true, length: { maximum: 1000 }
end
