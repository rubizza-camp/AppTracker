class AppDownloadsLoader
  DOWNLOADS_COST = 100
  attr_reader :shop_type, :id, :start_date, :device
  def initialize(shop_type, id, start_date, device)
    @shop_type = shop_type
    @id = id
    @start_date = start_date
    @device = device
  end

  def self.call(shop_type, id, start_date, device = '')
    new(shop_type, id, start_date, device).call
  end

  def call
    response
  end

  private

  def response
    RestClient.get("https://api.apptweak.com/#{shop_type}/applications/#{id}/downloads.json?start_date"+
                   "=#{start_date}#{device}&end_date=#{(Date.today-1)}",
                    'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(DOWNLOADS_COST))
  end
end