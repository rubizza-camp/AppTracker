module Services
  module Updaters
    class AverageRating < Services::Base
      attribute :total_rating
      attribute :new_ratings
      attribute :average_rating
      attribute :current_app

      private

      def perform
        @total_rating = 0.0
        new_ratings
        new_ratings.each do |local_rating|
          @total_rating += local_rating.average_rating
        end
        update_average
      end

      def new_ratings
        @new_ratings = Rating.where(app_id: current_app.id, date: Time.zone.yesterday)
      end

      def average_rating
        (@average_rating = total_rating / new_ratings.count).to_i
      end

      def update_average
        average_rating
        current_app.update(rating: average_rating)
      end
    end
  end
end
