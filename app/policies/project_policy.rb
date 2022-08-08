class ProjectPolicy < ApplicationPolicy
  # TODO: Check user is admin
  def show?
    record.members.include?(user) || record.author == user
  end

  def edit?
    record.members.include?(user) || record.author == user
  end
end
