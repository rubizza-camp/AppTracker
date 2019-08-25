class Services::Parsers::Metadata < Services::Parsers::Base
  ANDROID_HOST = 'https://play.google.com/store/apps/details?id='
  APPLE_HOST = "https://apps.apple.com/app/id"
  attribute :ids

  private

  def parse
    { android_app_id: ids[:android_app_id], apple_app_id: ids[:apple_app_id], title: super&.fetch('title'),
      icon_url: super&.fetch('icon'), short_description: super&.fetch('short_description'),
      long_description: super&.fetch('description'), 
      content_rating: super&.fetch('content_rating'),
      price: super&.fetch('price'), dev_name: super&.dig('developer', 'name'),
      dev_email: super&.dig('developer', 'email'), dev_website: super&.dig('developer', 'website'),
      android_url: "#{ANDROID_HOST}#{ids[:android_app_id]}", apple_url: "#{APPLE_HOST}#{ids[:apple_app_id]}" }
  end
  alias perform parse
end
