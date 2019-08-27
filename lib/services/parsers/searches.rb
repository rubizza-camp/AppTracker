class Services < Services::Parsers::Base
  class Parsers
    class Searches
      private

      def parse
        super&.first&.fetch('id')
      end
      alias perform parse
    end
  end
end
