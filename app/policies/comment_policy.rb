class CommentPolicy < ApplicationPolicy
  def create?
    if record.instance_of? Task
      return record.project.members.include?(user)
    end

    false
  end

  def update?
    if record.commentable.instance_of? Task
      return record.commentable.project.members.include?(user)
    end

    false
  end

  def destroy?
    if record.commentable.instance_of? Task
      return record.commentable.project.members.include?(user)
    end

    false
  end
end
