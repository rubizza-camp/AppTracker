class AppRatingsLoader
  attr_reader :cur_app, :start_date
  RATINGS_COST = 3
  def initialize(cur_app:, start_date:)
    @cur_app = cur_app
    @start_date = start_date
  end

  def self.load(cur_app, start_date)
    new(cur_app, start_date).load
  end

  def load
    ratings_response
  end

  private

  def ratings_response
    by_apple = AppRatingsParser.parse(load_ratings('ios', cur_app.android_app_id))
    by_android = AppRatingsParser.parse(load_ratings('android', cur_app.apple_app_id))
    { by_android: by_android, by_apple: by_apple }
  end

  def load_ratings(shop_type, id)
    RestClient.get("https://api.apptweak.com/#{shop_type}/applications/#{id}/ratings.json?start_date"+
                   "=#{start_date}&end_date=#{(Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(RATINGS_COST))
  end
end
