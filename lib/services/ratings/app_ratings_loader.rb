class AppRatingsLoader
  attr_reader :shop_type, :id, :start_date
  RATINGS_COST = 5
  def initialize(shop_type, id, start_date)
    @shop_type = shop_type
    @id = id
    @start_date = start_date
  end

  def self.call(shop_type, id, start_date)
    new(shop_type, id, start_date).call
  end

  def call
    ratings_response
  end

  private

  def ratings_response
    AppRatingsParser.call(load_ratings)
  end

  def load_ratings
    RestClient.get("https://api.apptweak.com/#{shop_type}/applications/#{id}/ratings.json?start_date" \
                   "=#{start_date}&end_date=#{(Time.zone.today - 1)}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(RATINGS_COST))
  end
end
