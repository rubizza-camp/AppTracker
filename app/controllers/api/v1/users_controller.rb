module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.find_or_create_by(user_params)
        user.subscriptions.create(app_params)
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
