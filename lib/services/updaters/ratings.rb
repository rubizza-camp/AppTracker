module Services
  module Updaters
    class Ratings < Services::Base
      attribute :current_app
      attribute :shop_type
      attribute :country
      attribute :start_date
      attribute :device
      attribute :id
      attribute :parsed_response

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

          @parsed_response = parse_ratings(load_ratings)
          update_ratings
        end
      end

      def load_ratings
        Services::ApptweakApi::Ratings.call(id: id, start_date: start_date, country: country,
                                            shop_type: shop_type, device: device)
      end

      def parse_ratings(response)
        Services::Parsers::Ratings.call(response: response)
      end

      def update_ratings
        (start_date..(Time.zone.today - 1)).each_with_index do |current_date, index|
          next unless parsed_response[index]

          create_rating(current_date, index)
        end
      end

      def create_rating(current_date, index)
        Rating.create(rating_1: rating_1(index), rating_2: rating_2(index),
                      rating_3: rating_3(index), rating_4: rating_4(index),
                      rating_5: rating_5(index), total_rating: total_rating(index),
                      average_rating: average_rating(index), shop_type: shop_type,
                      date: current_date.to_s, app_id: current_app.id, country: country)
      end

      def rating_1(index)
        parsed_response[index]['1']
      end

      def rating_2(index)
        parsed_response[index]['2']
      end

      def rating_3(index)
        parsed_response[index]['3']
      end

      def rating_4(index)
        parsed_response[index]['4']
      end

      def rating_5(index)
        parsed_response[index]['5']
      end

      def total_rating(index)
        parsed_response[index]['total']
      end

      def average_rating(index)
        parsed_response[index]['avg']
      end

      def set_start_date
        record = current_app.ratings.where(shop_type: shop_type, country: country).order(date: :desc).limit(1).first
        @start_date = record ? record.date + 1 : Time.zone.today - 1.month
      end
    end
  end
end
