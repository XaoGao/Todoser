module Users
  class SessionCreateUserService < Service
    def call(email: nil, password: nil)
      if email.nil? || password.nil?
        return failure(I18n.t("api.v1.sessions.errors.no_email_and_password"))
      end

      user = User.find_by email: email

      if user.blank? || !user.enable?
        return failure(I18n.t("api.v1.sessions.errors.user_not_found_blocked"))
      end

      if !user.valid_password?(password)
        return failure(I18n.t("api.v1.sessions.errors.incorrect_email_or_password"))
      end

      token = JwtService.encode(id: user.id, email: user.email, username: user.username)
      success(token)
    end
  end
end
