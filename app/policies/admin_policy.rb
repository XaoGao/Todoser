class AdminPolicy < ApplicationPolicy
  def any_admin_page?
    user&.admin?
  end
end
