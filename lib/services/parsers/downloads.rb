module Services
  module Parsers
    class Downloads < Services::Parsers::Base
      def perform
        super&.first&.fetch('downloads')
      end
    end
  end
end
