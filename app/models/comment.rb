class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :commentable, polymorphic: true, dependent: :destroy

  # TODO: remove body field
  # validates :body, presence: true, length: { maximum: 1000 }

  has_rich_text :message
end
