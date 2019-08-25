class Services::ApptweakApi::Searches < Services::ApptweakApi::Base
  def cost
    5
  end

  def query
    attributes.except(:shop_type, :end_date).compact.to_query
  end
end
