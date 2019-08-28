module Services
  module Parsers
    class Base < Services::Base
      attribute :response
      attribute :country
      attribute :field_name

      private

      def perform
        ::JSON.parse(response).dig(*path)
      end

      def field_name
        @field_name ||= self.class.name.demodulize.downcase
      end

      def path
        ['content', country].compact
      end
    end
  end
end
