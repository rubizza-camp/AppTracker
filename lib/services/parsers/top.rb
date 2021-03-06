module Services
  module Parsers
    class Top < Services::Parsers::Base
      KEYWORDS_LIMIT = 20
      attribute :keywords

      private

      def perform
        super&.each_with_object([]) do |keyword, keywords|
          return keywords if keywords[KEYWORDS_LIMIT]

          keywords << keyword['keyword'].to_s
        end
      end
    end
  end
end
