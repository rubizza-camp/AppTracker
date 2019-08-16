class AppMetaLoader
  attr_reader :ids
  def initialize(ids)
    @ids = ids
  end

  def self.meta(ids)
    new(ids).load_meta
  end

  private

  def load_meta
    RestClient.get("https://api.apptweak.com/android/applications/#{ids[:playmarket_app_id]}/metadata.json",
                   'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(20))
  end
end
