class InvitationPolicy < ApplicationPolicy
  def new?
    record.members.include?(user) || record.author == user
  end

  def create?
    record.members.include?(user) || record.author == user
  end

  def confirm?
    record.project.members.include?(user) || record.project.author == user
  end
end
