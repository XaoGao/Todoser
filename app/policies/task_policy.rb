class TaskPolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  def index?
    record.project.members.include?(user) || record.author != user
  end

  def new?
    record.project.members.include?(user) || record.author != user
  end

  def create?
    record.project.members.include?(user) || record.author != user
  end

  def edit?
    record.project.members.include?(user) || record.author != user
  end

  def update?
    record.project.members.include?(user) || record.author != user
  end

  def destroy?
    record.project.members.include?(user) || record.author != user
  end

  def show?
    record.project.members.include?(user) || record.author != user
  end
end
