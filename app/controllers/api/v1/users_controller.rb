module Api
  module V1
    class UsersController < ApplicationController
      def create
        app = App.find_by(title: app_params)
        user = User.find_or_create_by(user_params)
        user.subscription.create([subscriber_id: subscriber.id, app_id: app.id])
      end

      private

      def user_params
        params.permit(:email)
      end

      def app_params
        params.permit(:title)
      end
    end
  end
end
