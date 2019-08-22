class Services::ApptweakApi::Base < Services::Base
  HOST = "https://api.apptweak.com"
  attribute :id
  attribute :shop_type
  attribute :start_date
  attribute :end_date

  private

  def fetch
    binding.pry
    # ::RestClient.get("#{HOST}/#{shop_type}/applications/#{id}/#{resource}.json?#{query}",
    #                'X-Apptweak-Key': Services::ApiTokenManager.token_with_credits(cost))
  end

  def end_date
    Time.zone.today - 1
  end

  def query
    attributes.except(:shop_type, :id).merge(end_date: end_date)
  end
  alias perform fetch

  def resource; end

  def cost; end
end
