class Services::Parsers::Metadata < Services::Parsers::Base

  private

  def meta
    android_url = "https://play.google.com/store/apps/details?id=#{ids[:playmarket_app_id]}"
    apple_url = "https://apps.apple.com/app/id#{ids[:appstore_app_id]}"
    data_repsonse(android_url, apple_url)
  end

  def data_repsonse(android_url, apple_url)
    { android_app_id: android_app_id_response, apple_app_id: apple_app_id_response, title: title_response,
      icon_url: icon_url_response, s_desc: s_desc_response, l_desc: l_desc_response,
      content_rating: content_rating_response, price: price_response, android_url: android_url,
      apple_url: apple_url, dev_name: dev_name_response, dev_email: dev_email_response,
      dev_website: dev_website_response }
  end

  def android_app_id_response
    ids[:playmarket_app_id]
  end

  def apple_app_id_response
    ids[:appstore_app_id]
  end

  def title_response
    return '' unless response['content']['title']

    response['content']['title']
  end

  def icon_url_response
    return '' unless response['content']['icon']

    response['content']['icon']
  end

  def s_desc_response
    return '' unless response['content']['short_description']

    response['content']['short_description']
  end

  def l_desc_response
    return '' unless Nokogiri::HTML(response['content']['description']).text

    Nokogiri::HTML(response['content']['description']).text
  end

  def content_rating_response
    return '' unless response['content']['content_rating']

    response['content']['content_rating']
  end

  def price_response
    return '' unless response['content']['price']

    response['content']['price']
  end

  def dev_name_response
    return '' unless response['content']['developer']['name']

    response['content']['developer']['name']
  end

  def dev_email_response
    return '' unless response['content']['developer']['email']

    response['content']['developer']['email']
  end

  def dev_website_response
    return '' unless response['content']['developer']['website']

    response['content']['developer']['website']
  end
end
