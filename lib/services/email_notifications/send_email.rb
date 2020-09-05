module Services
  module EmailNotifications
    class SendEmail < Services::Base
      attribute :user_params
      attribute :app_params

      private

      def perform
        @user = User.new(user_params)
        if @user.save
          @user.subscriptions.create(app_params)
          UserMailer.registration_confirmation(@user).deliver_now
        else
          logger.info 'unable to create user'
        end
      end
    end
  end
end
