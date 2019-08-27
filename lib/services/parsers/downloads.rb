class Services < Services::Parsers::Base
  class Parsers
    class Downloads
      def parse
        super&.first&.fetch('downloads')
      end
      alias perform parse
    end
  end
end
