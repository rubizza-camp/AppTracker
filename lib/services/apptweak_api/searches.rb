class Services < Services::ApptweakApi::Base
  class ApptweakApi
    class Searches
      def path
        [HOST, shop_type, resource].compact.join('/')
      end

      def query
        attributes.except(:shop_type, :end_date).compact.to_query
      end
    end
  end
end
