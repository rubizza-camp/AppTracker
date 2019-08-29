module Services
  module Parsers
    class Ratings < Services::Parsers::Base
      def path
        super + ['ratings']
      end
    end
  end
end
