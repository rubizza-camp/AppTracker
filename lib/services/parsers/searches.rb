module Services
  module Parsers
    class Searches < Services::Parsers::Base
      private

      def perform
        super&.first&.fetch('id')
      end
    end
  end
end
