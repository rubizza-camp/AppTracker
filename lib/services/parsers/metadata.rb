class Services::Parsers::Metadata < Services::Parsers::Base
  ANDROID_HOST = 'https://play.google.com/store/apps/details?id='
  APPLE_HOST = "https://apps.apple.com/app/id"
  attribute :ids

  private

  def parse
    content = super
    return unless super
    { android_app_id: ids[:android_app_id], apple_app_id: ids[:apple_app_id], title: content.fetch('title'),
      icon_url: content.fetch('icon'), short_description: content.fetch('short_description'),
      long_description: content.fetch('description'), 
      content_rating: content.fetch('content_rating'),
      price: content.fetch('price'), dev_name: content.dig('developer', 'name'),
      dev_email: content.dig('developer', 'email'), dev_website: content.dig('developer', 'website'),
      android_url: "#{ANDROID_HOST}#{ids[:android_app_id]}", apple_url: "#{APPLE_HOST}#{ids[:apple_app_id]}" }
  end
  alias perform parse
end
