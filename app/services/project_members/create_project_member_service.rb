module ProjectMembers
  class CreateProjectMemberService < Service
    def call(project, user)
      project_member = ProjectMember.new(user: user, project: project)
      if project_member.save
        success(project_member)
      else
        failure(project_member.errors.full_messages)
      end
    end
  end
end
