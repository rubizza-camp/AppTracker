class Services < Services::Parsers::Base
  class Parsers
    class Power
      def parse
        super&.first&.fetch('power')
      end
      alias perform parse
    end
  end
end
