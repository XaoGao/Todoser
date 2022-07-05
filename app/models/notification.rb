# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  body       :string          not null
#  read_at    :datetime         default: nil
#
class Notification < ApplicationRecord

  validates :body, presence: true, length: { in: 1..200 }

  def read
    self.update(read_at: DateTime.now)
  end
end
