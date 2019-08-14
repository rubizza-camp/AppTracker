require_relative 'api_token_manager'
class Services
  class ApiData
    class << self
      def update_app(_name)
        ApplicationController.logger.info 'update_app'
      end

      def update_app_all
        ApplicationController.logger.info 'update_app_all'
      end
    end
  end
end
