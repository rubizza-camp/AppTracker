require_relative 'api_token_manager'
class Services
  class ApiData
    class << self
      def update_app(name)
        AppUpdater.update(name)
      end

      def update_app_all
        AppUpdater.update_all
      end
    end
  end
end
