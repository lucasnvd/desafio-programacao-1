module Services::Api::V1
  class UserVerifierService
    include Interactor

    def call
      if context.user_uuid.present?
        user = User.find_by(uuid: context.user_uuid)
        context.fail!(error: cannot_find_user_error_data) if user.nil?

        context.user = user
      else
        context.fail!(error: missing_uuid_error_data)
      end
    end

    private

    def cannot_find_user_error_data
      {
        msg: "Cannot find user with uuid #{context.user_uuid}",
        code: 102
      }
    end

    def missing_uuid_error_data
      {
        msg: 'Missing user\'s uuid.',
        code: 101
      }
    end

  end
end
