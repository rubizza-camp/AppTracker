module Api
  module V1
    class SubscribersController < ApplicationController
      def create
        app = App.find_by(title: app_params)
        subscriber = Subscriber.find_or_create_by(sub_params)
        Subscription.create([subscriber_id: subscriber.id, app_id: app.id])
      end

      private

      def sub_params
        params.permit(:email)
      end

      def app_params
        params.permit(:title)
      end
    end
  end
end
