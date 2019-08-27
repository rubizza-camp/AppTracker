class Services < Services::Base
  class Updaters
    class Ratings
      attribute :current_app
      attribute :shop_type
      attribute :country
      attribute :start_date
      attribute :device
      attribute :id

      private

      def perform
        load_by_android
        load_by_ios
      end

      def load_by_android
        @shop_type = 'android'
        @device = nil
        @id = current_app.android_app_id
        date
        return if @start_date > Time.zone.today - 2

        update_app
      end

      def load_by_ios
        @shop_type = 'ios'
        @device = 'iphone'
        @id = current_app.apple_app_id
        date
        return if @start_date > Time.zone.today - 2

        update_app
      end

      def update_app
        TargetCountry.pluck(:country_name).each do |country|
          @country = country
          update_ratings(parse_ratings(load_ratings))
        end
      end

      def load_ratings
        Services::ApptweakApi::Ratings.call(id: id, start_date: start_date, country: country,
                                            shop_type: shop_type, device: device)
      end

      def parse_ratings(response)
        Services::Parsers::Ratings.call(response: response)
      end

      def update_ratings(response)
        (start_date..(Time.zone.today - 1)).each_with_index do |current_date, index|
          Rating.create(rating_1: response[index]['1'], rating_2: response[index]['2'],
                        rating_3: response[index]['3'], rating_4: response[index]['4'],
                        rating_5: response[index]['5'], total_rating: response[index]['total'],
                        average_rating: response[index]['avg'], shop_type: shop_type,
                        date: current_date.to_s, app_id: current_app.id)
        end
      end

      def date
        record = current_app.ratings.where(shop_type: shop_type).order(date: :desc).limit(1).first
        @start_date = if record
                        record.date
                      else
                        Time.zone.today - 1.month
                      end
      end
    end
  end
end
