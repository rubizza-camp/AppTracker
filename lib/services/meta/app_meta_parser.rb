class AppMetaParser
  attr_reader :ids, :response
  def initialize(ids, response)
    @ids = ids
    @response = response
  end
  
  def parse_meta
    meta
  end

  def self.parse_meta(ids, response)
    new(ids, response).parse_meta
  end

  private

  def meta # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    android_app_id = ids[:playmarket_app_id]
    apple_app_id = ids[:appstore_app_id]
    android_url = "https://play.google.com/store/apps/details?id=#{android_app_id}"
    apple_url = "https://apps.apple.com/app/id#{apple_app_id}"
    title = JSON.parse(response)['content']['title']
    icon_url = JSON.parse(response)['content']['icon']
    s_desc = JSON.parse(response)['content']['short_description']
    l_desc = Nokogiri::HTML(JSON.parse(response)['content']['description']).text
    content_rating = JSON.parse(response)['content']['content_rating']
    price = JSON.parse(response)['content']['price']
    dev_name = JSON.parse(response)['content']['developer']['name']
    dev_email = JSON.parse(response)['content']['developer']['email']
    dev_website = JSON.parse(response)['content']['developer']['website']
    { android_app_id: android_app_id, apple_app_id: apple_app_id, title: title, icon_url: icon_url,
      s_desc: s_desc, l_desc: l_desc, content_rating: content_rating, price: price, android_url: android_url,
      apple_url: apple_url, dev_name: dev_name, dev_email: dev_email, dev_website: dev_website }
  end
end
