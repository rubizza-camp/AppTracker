module Services
  module Parsers
    class Ranks < Services::Parsers::Base
      attribute :shop_type

      private

      def path
        super + ['ranks', key]
      end

      def key
        { android: 'ALL', ios: '0' }[shop_type.to_sym]
      end
    end
  end
end
