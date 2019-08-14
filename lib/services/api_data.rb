require_relative 'api_token_manager'
class Services
  class ApiData
    class << self
      def update_app(name)
        AppDynamicUpdater.update(name)
      end

      def update_app_all
        AppDynamicUpdater.update_all
      end
    end
  end
end
