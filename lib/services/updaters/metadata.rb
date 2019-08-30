module Services
  module Updaters
    class Metadata < Services::Base
      attribute :term

      private

      def perform
        android_id = Services::Parsers::Searches.call(response:
        Services::ApptweakApi::Searches.call(term: term, shop_type: 'android'))
        app = App.find_by(android_app_id: android_id)
        return app if app

        apple_id = Services::Parsers::Searches.call(response:
          Services::ApptweakApi::Searches.call(term: term, shop_type: 'ios'))
        ids = { android_app_id: android_id, apple_app_id: apple_id }
        App.create(Services::Parsers::Metadata.call(response: Services::ApptweakApi::Metadata.call(
          id: android_id, shop_type: 'android'
        ), ids: ids))
      end
    end
  end
end
