module Services
  module Updaters
    class AvgRating < Services::Base
      attribute :average_rating
      attribute :current_app

      private

      def perform
        @average_rating = 0.0
        Rating.where(app_id: current_app.id, date: Time.zone.yesterday).select('average_rating').each do |local_rating|
          @average_rating += local_rating.average_rating
        end
        update_average
      end

      def update_average
        (@average_rating /= Rating.where(app_id: current_app.id, date: Time.zone.yesterday).count).to_i
        current_app.update(rating: average_rating)
      end
    end
  end
end
