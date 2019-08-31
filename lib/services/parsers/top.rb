module Services
  module Parsers
    class Top < Services::Parsers::Base
      attribute :keywords

      private

      def perform
        @keywords = []
        super&.each_with_index do |keyword, index|
          @keywords << keyword['keyword']
          break if index == 20
        end
        keywords
      end
    end
  end
end
