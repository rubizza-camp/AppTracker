module Services
  module Parsers
    class Metadata < Services::Parsers::Base
      ANDROID_HOST = 'https://play.google.com/store/apps/details?id='.freeze
      APPLE_HOST = 'https://apps.apple.com/app/id'.freeze
      attribute :ids

      private

      def perform
        content = super
        return unless content

        { android_app_id: ids[:android_app_id], apple_app_id: ids[:apple_app_id],
          title: content.fetch('title').downcase,
          icon_url: content.fetch('icon'), short_description: content.fetch('short_description'),
          long_description: content.fetch('description'),
          content_rating: content.fetch('content_rating'),
          price: content.fetch('price'), dev_name: content.dig('developer', 'name'),
          dev_email: content.dig('developer', 'email'), dev_website: content.dig('developer', 'website'),
          android_url: "#{ANDROID_HOST}#{ids[:android_app_id]}", apple_url: "#{APPLE_HOST}#{ids[:apple_app_id]}" }
      end
    end
  end
end
