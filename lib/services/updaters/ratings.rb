module Services
  module Updaters
    class Ratings < Services::Base
      attribute :current_app
      attribute :shop_type
      attribute :country
      attribute :start_date
      attribute :device
      attribute :id

      private

      def perform
        init_params_by_android
        init_params_by_ios
      end

      def init_params_by_android
        @shop_type = 'android'
        @device = nil
        @id = current_app.android_app_id
        update_app
      end

      def init_params_by_ios
        @shop_type = 'ios'
        @device = 'iphone'
        @id = current_app.apple_app_id
        update_app
      end

      def update_app
        TargetCountry.pluck(:country_name).each do |country|
          @country = country
          set_start_date
          next if start_date > Time.zone.today - 1

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
          next unless response[index]

          Rating.create(rating_1: response[index]['1'], rating_2: response[index]['2'],
                        rating_3: response[index]['3'], rating_4: response[index]['4'],
                        rating_5: response[index]['5'], total_rating: response[index]['total'],
                        average_rating: response[index]['avg'], shop_type: shop_type,
                        date: current_date.to_s, app_id: current_app.id, country: country)
        end
      end

      def set_start_date
        record = current_app.ratings.where(shop_type: shop_type, country: country).order(date: :desc).limit(1).first
        @start_date = record ? record.date + 1 : Time.zone.today - 1.month
      end
    end
  end
end
