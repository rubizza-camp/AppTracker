class AppIdLoader < AppMothership
  attr_reader :app_name
  def initialize(app_name)
    @app_name = app_name
  end

  def app_id
    app_id_load
  end

  def self.app_id(app_name)
    new(app_name).app_id
  end

  private

  def app_id_load
    playmarket_app_id = JSON.parse(
      RestClient.get("https://api.apptweak.com/android/searches.json?term=#{app_name}",
                     'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(10))
    )['content'].first['id']
    appstore_app_id = JSON.parse(
      RestClient.get("https://api.apptweak.com/ios/searches.json?term=#{app_name}",
                     'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(10))
    )['content'].first['id']
    { playmarket_app_id: playmarket_app_id, appstore_app_id: appstore_app_id }
  end
end
