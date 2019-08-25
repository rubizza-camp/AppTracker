class Services::Parsers::Metadata < Services::Parsers::Base
  ANDROID_HOST = 'https://play.google.com/store/apps/details?id='
  APPLE_HOST = "https://apps.apple.com/app/id"
  attribute :ids

  private

  def parse
    { android_app_id: ids[:android_app_id], apple_app_id: ids[:apple_app_id], title: super&.fetch(title_response),
      icon_url: super&.fetch(icon_url_response), short_description: super&.fetch(s_desc_response),
      # long_description: super&.fetch(l_desc_response), 
      content_rating: super&.fetch(content_rating_response),
      price: super&.fetch(price_response),# dev_name: super&.(dev_name_response),
      # dev_email: super&.(dev_email_response), dev_website: super&.(dev_website_response),
      android_url: "#{ANDROID_HOST}#{ids[:android_app_id]}", apple_url: "#{APPLE_HOST}#{ids[:apple_app_id]}" }
  end
  alias perform parse

  def title_response
    'title'
  end

  def icon_url_response
    'icon'
  end

  def s_desc_response
    'short_description'
  end

  def l_desc_response
    # Nokogiri::HTML(['description']).text
  end

  def content_rating_response
    'content_rating'
  end

  def price_response
    'price'
  end

  def dev_name_response
    # ['developer', 'name']
  end

  def dev_email_response
    fetch.('developer', 'email')
  end

  def dev_website_response
    fetch.('developer', 'website')
  end
end
