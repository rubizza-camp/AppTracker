class AppDynamicLoader
  attr_reader :cur_app, :country, :start_date
  RANKS_COST = 2
  POWER_COST = 3
  DOWNLOADS_COST = 100
  def initialize(cur_app:, country:, start_date:)
    @cur_app = cur_app
    @country = country
    @start_date = start_date.to_s
  end

  def self.dynamic_load(cur_app, country, start_date)
    new(cur_app, country, start_date).dynamic_load
  end

  def dynamic_load
    dynamic_response
  end

  private

  def dynamic_response
    by_android = AppDynamicParser.dynamic_parse_by_android({ ranks: load_ranks('android', cur_app.android_app_id),
                                                             power: load_power('android', cur_app.android_app_id),
                                                             downloads: load_downloads('android',
                                                             cur_app.android_app_id),
                                                             country: country })
    by_apple = AppDynamicParser.dynamic_parse_by_apple({ ranks: load_ranks('ios', cur_app.apple_app_id, 'iPhone'),
                                                         power: load_power('ios', cur_app.apple_app_id, 'iPhone'),
                                                         downloads: load_downloads('ios',
                                                         cur_app.apple_app_id, 'iPhone'),
                                                         country: country })
    { by_android: by_android, by_apple: by_apple }
  end

  def load_ranks(shop_type, id, device = '')
      RestClient.get("https://api.apptweak.com/#{shop_type}/applications/#{id}/rankings.json?country"+
                     "=#{country}#{device}&start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                      'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(RANKS_COST))
  end

  def load_power(shop_type, id, device = '')
    RestClient.get("https://api.apptweak.com/#{shop_type}/applications/#{id}/power.json?country"+
                   "=#{country}#{device}&start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                    'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(POWER_COST))
  end

  def load_downloads(shop_type, id, device = '')
    RestClient.get("https://api.apptweak.com/#{shop_type}/applications/#{id}/downloads.json?start_date"+
                   "=#{start_date}#{device}&end_date=#{(Date.today-1).to_s}",
                    'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(DOWNLOADS_COST))
  end
end
