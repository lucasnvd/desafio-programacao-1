
module Api::V1
  class BaseController < ActionController::API
    include Services::Api::V1
    before_action :verify_user!

    def current_user
      @current_user
    end

    private

    def verify_user!
      result = UserVerifierService.call(user_uuid: request.headers['USER-UUID'])

      if result.success?
        @current_user = result.user
      else
        render(json: { error: result.error }, status: 401)
      end
    end

  end
end
