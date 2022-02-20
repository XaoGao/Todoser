class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, foreign_key: 'author_id'

  def full_name
    "#{first_name} #{last_name}"
  end
end
