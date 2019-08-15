class AppDynamicLoader
  attr_reader :id, :country, :start_date
  def initialize(id, country, start_date)
    @id = id
    @country = country
    @start_date = start_date
  end

  def self.dynamic_load_by_android(id, country, start_date)
    new(id, country, start_date).dynamic_load_by_android
  end

  def self.dynamic_load_by_apple(id, country, start_date)
    new(id, country, start_date).dynamic_load_by_apple
  end

  def dynamic_load_by_android
    load_dynamic_by_android
  end

  def dynamic_load_by_apple
    load_dynamic_by_apple
  end

  private

  def load_dynamic_by_android
    AppDynamicParser.dynamic_parse_by_andriod { ranks: load_ranks_by_android, power: load_power_by_android,
                                                downloads: load_downloads_by_android }
  end

  def load_dynamic_by_apple
    AppDynamicParser.dynamic_parse_by_apple { ranks: load_ranks_by_apple, power: load_power_by_apple,
                                              downloads: load_downloads_by_apple }
  end

  def load_ranks_by_android
    RestClient.get("https://api.apptweak.com/android/applications/#{id}/rankings.json?country=#{country}&
                    start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(20))
  end

  def load_power_by_android
    RestClient.get("https://api.apptweak.com/android/applications/#{id}/power.json?country=#{country}&
                    start_date=#{start_date}&end_date=#{Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(20))
  end

  def load_downloads_by_android
    RestClient.get("https://api.apptweak.com/android/applications/#{id}/downloads.json?
                    start_date=#{start_date}&end_date=#{Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(100))
  end

  def load_ranks_by_apple
    RestClient.get("https://api.apptweak.com/ios/applications/#{id}/rankings.json?country=#{country}&
                    device=iphone&start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(20))
  end

  def load_power_by_apple
    RestClient.get("https://api.apptweak.com/ios/applications/#{id}/rankings.json?country=#{country}&
                    device=iphone&start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(20))
  end

  def load_downloads_by_apple
    RestClient.get("https://api.apptweak.com/ios/applications/#{id}/rankings.json?country=#{country}&
                    device=iphone&start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(100))
  end
end
