class Services::ApptweakApi::Base < Services::Base
  HOST = 'https://api.apptweak.com'
  attribute :shop_type
  attribute :id
  attribute :start_date
  attribute :end_date
  attribute :term
  attribute :device

  private

  def fetch
    ::RestClient.get("#{HOST}/#{shop_type}/#{applications}#{id}#{id ? '/'  : ''}#{resource}.json?#{query}",
                     'X-Apptweak-Key': ApiToken.use(cost))
  end
  alias perform fetch

  def end_date
    Time.zone.today - 1
  end

  def query
    attributes.except(:shop_type, :id).merge(end_date: end_date).compact.to_query
  end

  def resource
    self.class.name.demodulize.downcase
  end

  def cost
    raise 'set the cost'
  end

  def applications; end
end
