module Api
  module V1
    class SessionsController < Api::ApiController
      def create(email, password)
        user = User.find_by email: email
        if user && user.valid_password?(password)
          token = JwtService.encode({ id: user.id, email: email, username: user.username })
          render status: :ok, json: token
        else
          render status: :bad_request, json: 'User not found or incorrect password'
        end
      end
    end
  end
end
