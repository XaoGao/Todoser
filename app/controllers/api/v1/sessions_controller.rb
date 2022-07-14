module Api
  module V1
    class SessionsController < Api::ApiController
      def create
        result = Users::SessionCreateUserService.new.call(email: params[:email], password: params[:password])
        
        if result.success?
          ok(token: result.data)
        else
          bad_request(result.error_messages)
        end
      end
    end
  end
end
