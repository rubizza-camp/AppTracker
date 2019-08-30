module Services
  module Updaters
    class AverageRating < Services::Base
      attribute :average_rating
      attribute :current_app

      private

      def perform
        @average_rating =
          Rating.where(app_id: current_app.id, date: Time.zone.yesterday).average(:average_rating).round
        update_average
      end

      def update_average
        current_app.update(rating: average_rating)
      end
    end
  end
end
