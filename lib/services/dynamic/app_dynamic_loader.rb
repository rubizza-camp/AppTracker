class AppDynamicLoader
  attr_reader :shop_type, :id, :start_date, :device, :country
  def initialize(shop_type, id, start_date, country, device)
    @shop_type = shop_type
    @id = id
    @start_date = start_date.to_s
    @device = device
    @country = country
  end

  def self.call(shop_type, id, start_date, country, device = '')
    new(shop_type, id, start_date, country, device).call
  end

  def call
    { power: load_power, ranks: load_ranks }
  end

  private

  def load_power
    AppPowerLoader.call(country, shop_type, id, start_date, device)
  end

  def load_ranks
    AppRanksLoader.call(country, shop_type, id, start_date, device)
  end
end
