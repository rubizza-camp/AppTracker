module Services
  module Parsers
    class Power < Services::Parsers::Base
      def perform
        super&.first&.fetch('power')
      end
    end
  end
end
