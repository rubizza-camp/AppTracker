module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(params[:email])
        @user.set_confirmation_token
        @user.save(validate: false)
        UserMailer.registration_confirmation(@user).deliver_now
        # @user.subscriptions.create(app_params)
      end

      def confirm_email
        user = User.find_by_confirm_token(params[:token])
        user.validate_email
        user.save(validate: false)
        redirect_to user
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
