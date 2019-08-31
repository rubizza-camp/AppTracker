module Services
  module ApptweakApi
    class Top < Services::ApptweakApi::Base
      def cost
        100
      end

      def query
        attributes.except(:shop_type, :end_date, :id).compact.to_query
      end

      def resource
        'keywords/' + self.class.name.demodulize.downcase
      end
    end
  end
end
