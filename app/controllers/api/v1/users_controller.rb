module Api
  module V1
    class UsersController < ApplicationController
      MAIN_PAGE_URL = 'https://apptracker.club'

      def create
        @user = User.new(user_params)
        if @user.save
          @user.subscriptions.create(app_params)
          UserMailer.registration_confirmation(@user).deliver_now
        else
          puts 'something should be here'
        end
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
