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
    ::RestClient.get("#{path}.json?#{query}",
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
    5
  end

  def path
    [HOST, shop_type, 'applications', id, resource].compact.join('/')
  end
end
# IOS Ratings NIL
# IOS Rankings Bad request