module Api
  module V1
    class UsersController < ApplicationController
      def create
        app = App.find(app_params[:id])
        user = User.find_or_create_by(user_params)
        user.subscription.create(app_id: app.id)
      end

      private

      def user_params
        params.permit(:email)
      end

      def app_params
        params.permit(:id)
      end
    end
  end
end
