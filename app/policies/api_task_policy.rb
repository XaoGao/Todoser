class ApiTaskPolicy < ApplicationPolicy
  def show?
    record.project.members.include?(user)
  end
end
