module Services
  module Updaters
    class Keywords < Services::Base
      attribute :current_app
      attribute :id
      attribute :shop_type
      attribute :device

      private

      def perform
        init_params_by_android
        init_params_by_ios
      end

      def init_params_by_android
        @shop_type = 'android'
        @device = nil
        @id = current_app.android_app_id
        insert_keywords
      end

      def init_params_by_ios
        @shop_type = 'ios'
        @device = 'iphone'
        @id = current_app.apple_app_id
        insert_keywords
      end

      def fetch_and_parse_keywords
        Services::Parsers::Top.call(response: Services::ApptweakApi::Top.call(id: id, shop_type: shop_type,
                                                                              device: device, country: 'us'))
      end

      def insert_keywords
        fetch_and_parse_keywords.each do |keyword|
          keyword_record = Keyword.find_by(value: keyword)
          keyword_record ||= Keyword.create(value: keyword)
          current_app.keywords << keyword_record unless current_app.apps_keywords.find_by(keyword_id: keyword_record.id)
        end
      end
    end
  end
end
