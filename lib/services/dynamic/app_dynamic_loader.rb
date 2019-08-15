class AppDynamicLoader
  attr_reader :id, :country, :start_date, :end_date
  def initialize
    @id = id
    @country = country
    @start_date = start_date
    @end_date = end_date
  end

  def self.dynamic_load(id, country, start_date, end_date)
    dynamic_load.new.dynamic_load(id, country, start_date, end_date)
  end

  def dynamic_load(_id, _country, _start_date, _end_date)
    load_dynamic
  end

  private

  def load_dynamic
    { ranks: load_ranks, power: load_power, downloads: load_downloads }
  end

  def load_ranks
    RestClient.get("https://api.apptweak.com/android/applications/#{id}/rankings.json?country=#{country}&
                    start_date=#{start_date}&end_date=#{end_date}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits)
  end

  def load_power
    RestClient.get("https://api.apptweak.com/android/applications/#{id}/power.json?country=#{country}&
                    start_date=#{start_date}&end_date=#{end_date}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits)
  end

  def load_downloads
    RestClient.get("https://api.apptweak.com/android/applications/#{id}/downloads.json?
                    start_date=#{start_date}&end_date=#{end_date}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits)
  end
end