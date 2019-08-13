class AppMetaLoader
  def meta(ids)
    load_meta(ids)
  end
  
  def self.meta(ids)
    new.meta(ids)
  end
  
  private
  
  def load_meta(ids)
    RestClient.get("https://api.apptweak.com/android/applications/#{ids[:playmarket_app_id]}/metadata.json",
                  {'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(5)})
  end
end
