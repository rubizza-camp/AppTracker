class Services::ApptweakApi::Searches < Services::ApptweakApi::Base
  def path
    [HOST, shop_type, resource].compact.join('/')
  end

  def query
    attributes.except(:shop_type, :end_date).compact.to_query
  end
end
