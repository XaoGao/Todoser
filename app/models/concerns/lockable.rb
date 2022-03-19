module Lockable
  extend ActiveSupport::Concern

  included do
    scope :disabled, -> { where.not(delete_at: nil) }
    scope :enabled, -> { where(delete_at: nil) }
  end
end
