module Api
  module V1
    class UsersController < ApplicationController
      MAIN_PAGE_URL = 'https://apptracker.club'.freeze

      def create
        Services::EmailNotifications::SendEmail.call(app_params: app_params, user_params: user_params)
      end

      def confirm_email
        user = User.find_by(confirmation_token: params[:token])
        user.update(confirmation_token: nil)
        redirect_to MAIN_PAGE_URL
      end

      private

      def user_params
        params.permit(:email)
      end

      def app_params
        params.permit(:app_id)
      end
    end
  end
end
