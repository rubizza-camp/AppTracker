class Services < Services::Parsers::Base
  class Parsers
    class Ratings
      def path
        super + ['ratings']
      end
    end
  end
end
