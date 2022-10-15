module Invitations
  class InvitationConfirmService < Service
    def call(invitation)
      ActiveRecord::Base.transaction do
        invitation.update(agree: true)
        ProjectMember.create(project: invitation.project, user: invitation.recipient)
      end
    end
  end
end
