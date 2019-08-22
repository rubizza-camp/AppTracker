class Services::ApptweakApi::Downloads < Services::ApptweakApi::Base
  RESOURCE = 'downloads'

  def resource
    'downloads'
  end

  def cost
    100
  end
end
