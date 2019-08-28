module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)
        @user.save
        @user.subscriptions.create(app_params)
        UserMailer.registration_confirmation(@user).deliver_now
      end

      def confirm_email
        user = User.find_by(confirmation_token: params[:token])
        user.update(confirmation_token: nil)
        redirect_to 'https://apptracker.club'
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
