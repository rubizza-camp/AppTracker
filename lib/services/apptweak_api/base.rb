class Services::ApptweakApi::Base < Services::Base
  HOST = 'https://api.apptweak.com'
  HEADER = 'X-Apptweak-Key'
  attribute :shop_type
  attribute :id
  attribute :start_date
  attribute :end_date

  private

  def fetch
    ::RestClient.get("#{HOST}/#{shop_type}/#{applications}#{id}/#{resource}.json?#{query}",
                      HEADER: ::Services::ApiTokenManager.token_with_credits(cost))
  end
  alias perform fetch

  def end_date
    Time.zone.today - 1
  end

  def query
    attributes.compact.except(:shop_type, :id).merge(end_date: end_date)
  end

  def resource
    class.name.demodulize.downcase
  end

  def cost
    raise 'set the cost'
  end

  def applications; end
end
