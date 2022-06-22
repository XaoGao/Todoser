class FavoritePolicy < ApplicationPolicy
  # TODO: reforctor for polymorphic
  def create?
    if record.instance_of? Task
      return record.project.members.include?(user)
    end

    false
  end

  def destroy?
    if record.instance_of? Task
      return record.project.members.include?(user)
    end

    false
  end
end
