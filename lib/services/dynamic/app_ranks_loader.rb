class AppRanksLoader
  RANKS_COST = 2
  attr_reader :country, :shop_type, :id, :start_date, :device
  def initialize(country, shop_type, id, start_date, device)
    @country = country  
    @shop_type = shop_type
    @id = id
    @start_date = start_date
    @device = device
  end

  def self.call(country, shop_type, id, start_date, device = '')
    new(country, shop_type, id, start_date, device).call
  end

  def call
    response
  end

  private

  def response
    AppRanksParser.call(load_info, shop_type)
  end

  def load_info
    RestClient.get("https://api.apptweak.com/#{shop_type}/applications/#{id}/rankings.json?country"+
                   "=#{country}#{device}&start_date=#{start_date}&end_date=#{(Date.today-1)}",
                    'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(RANKS_COST))
  end
end
