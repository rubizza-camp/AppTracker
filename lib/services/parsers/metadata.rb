module Services
  module Parsers
    class Metadata < Services::Parsers::Base
      ANDROID_HOST = 'https://play.google.com/store/apps/details?id='.freeze
      APPLE_HOST = 'https://apps.apple.com/app/id'.freeze
      attribute :ids
      attribute :content 
      private

      def perform
        @content = super
        return unless content
        { android_app_id: android_id, apple_app_id: apple_id, title: title,
          icon_url: icon_url, short_description: short_description,
          long_description: long_description, content_rating: content_rating,
          price: price, dev_name: developer_name, dev_email: developer_email,
          dev_website: developer_website, android_url: android_url, apple_url: apple_url }
      end

      def android_id
        ids[:android_app_id]
      end

      def apple_id
        ids[:apple_app_id]
      end

      def title
        content.fetch('title').downcase
      end

      def short_description
        content.fetch('short_description')
      end

      def long_description
        content.fetch('description')
      end

      def icon_url
        content.fetch('icon')
      end

      def content_rating
        content.fetch('content_rating')
      end

      def price
        content.fetch('price')
      end

      def developer_name
        content.dig('developer', 'name')
      end

      def developer_email
        content.dig('developer', 'email')
      end

      def developer_website
        content.dig('developer', 'website')
      end

      def android_url
        "#{ANDROID_HOST}#{ids[:android_app_id]}"
      end

      def apple_url
        "#{APPLE_HOST}#{ids[:apple_app_id]}"
      end
    end
  end
end
