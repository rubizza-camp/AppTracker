class AppRatingsLoader
  attr_reader :id, :start_date
  def initialize(id, start_date)
    @id = id
    @start_date = start_date
  end

  def self.load_by_android(id, start_date)
    new(id, start_date).load_by_android
  end
  
  def self.load_by_apple(id, start_date)
    new(id, start_date).load_by_apple
  end

  def load_by_android
    ratings_by_android_response
  end

  def load_by_apple
    ratings_by_apple_response
  end

  private

  def ratings_by_android_response
    AppRatingsParser.parse(load_ratings_by_android)
  end

  def ratings_by_apple_response
    AppRatingsParser.parse(load_ratings_by_apple)
  end

  def load_ratings_by_android
    RestClient.get("https://api.apptweak.com/android/applications/#{id}/ratings.json?start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(3))
  end

  def load_ratings_by_apple
    RestClient.get("https://api.apptweak.com/ios/applications/#{id}/ratings.json?start_date=#{start_date}&end_date=#{(Date.today-1).to_s}",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(3))
  end
end
