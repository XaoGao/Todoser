module Lockable
  extend ActiveSupport::Concern

  included do
    scope :disabled, -> { where.not(delete_at: nil) }
    scope :enabled, -> { where(delete_at: nil) }
  end

  def disabled
    self.update(delete_at: DateTime.now)
  end

  def enabled
    self.update(delete_at: nil)
  end
end
