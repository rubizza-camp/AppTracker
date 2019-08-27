class Services < Services::Base
  class Parsers
    class Base
      attribute :response
      attribute :country
      attribute :field_name

      private

      def parse
        ::JSON.parse(response).dig(*path)
      end
      alias perform parse

      def field_name
        @field_name ||= self.class.name.demodulize.downcase
      end

      def path
        ['content', country].compact
      end
    end
  end
end
