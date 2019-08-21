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

  def meta
    android_url = "https://play.google.com/store/apps/details?id=#{ids[:playmarket_app_id]}"
    apple_url = "https://apps.apple.com/app/id#{ids[:appstore_app_id]}"
    @response = JSON.parse(response)
    data_repsonse(android_url, apple_url)
  end
  
  def data_repsonse(android_url, apple_url)
    { android_app_id: ids[:playmarket_app_id], apple_app_id: ids[:appstore_app_id],
    title: response['content']['title'], icon_url: response['content']['icon'],
    s_desc: response['content']['short_description'],
    l_desc: Nokogiri::HTML(response['content']['description']).text,
    content_rating: response['content']['content_rating'], price: response['content']['price'],
    android_url: android_url, apple_url: apple_url, dev_name: response['content']['developer']['name'],
    dev_email: response['content']['developer']['email'],
    dev_website: response['content']['developer']['website'] }
  end
end
