module Invitations
  class InvitationCreateService < Service
    def call(recipient_email, sender, project)
      user = User.find_by(email: recipient_email)
      if user.nil?
        return failure(I18n.t("invitations.create.user_not_found"))
      end

      token = generate_token
      @invitation = Invitation.new(recipient: user, sender: sender, token: token, project: project)

      if @invitation.save
        success(I18n.t("invitations.create.success", username: user.full_name))
      else
        failure(I18n.t("invitations.create.error"))
      end
    end

    private

    def generate_token
      loop do
        token = SecureRandom.hex(10)

        break token unless Invitation.exists?(token: token)
      end
    end
  end
end
