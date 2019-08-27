class Services::Updaters::Dynamic < Services::Base
  attr_reader :downloads, :power, :ranks
  attribute :current_app
  attribute :country
  attribute :start_date
  attribute :dynamic_info
  attribute :shop_type
  attribute :id
  attribute :device

  private

  def perform
    @dynamic_info = {}
    load_by_android
    @dynamic_info = {}
    load_by_ios
  end

  def load_by_android
    @shop_type = 'android'
    @device = nil
    @id = current_app.android_app_id
    date
    return if @start_date > Time.zone.today - 2
    update_app
  end

  def load_by_ios
    @shop_type = 'ios'
    @device = 'iphone'
    @id = current_app.apple_app_id
    date
    return if @start_date > Time.zone.today - 2
    update_app
  end

  def date
    record = current_app.dynamic_infos.where(shop_type: shop_type).order(date: :desc).limit(1).first
    if record
      @start_date = record.date
    else
      @start_date = Time.zone.today - 1.month
    end 
  end

  def update_app
    load_downloads
    TargetCountry.pluck(:country_name).each do |country|
      @country = country
      load_power
      load_rankings
      parse_dynamic
    end
  end

  def load_downloads
    @downloads = Services::ApptweakApi::Downloads.call(id: id, start_date: start_date,
                                                       shop_type: shop_type, device: device)
  end

  def load_power
    @power = Services::ApptweakApi::Power.call(id: id, start_date: start_date, country: country,
                                               shop_type: shop_type, device: device)
  end

  def load_rankings
    @ranks = Services::ApptweakApi::Rankings.call(id: id, start_date: start_date, country: country,
                                                     shop_type: shop_type, device: device) 
  end

  def parse_dynamic

    parse_downloads
    parse_power
    parse_ranks
    update
  end

  def parse_downloads
    @dynamic_info[:downloads] = Services::Parsers::Downloads.call(response: downloads, country: country)
  end

  def parse_power
    @dynamic_info[:power] = Services::Parsers::Power.call(response: power, country: country)
  end

  def parse_ranks
    @dynamic_info[:ranks] = Services::Parsers::Ranks.call(response: ranks, shop_type: shop_type)
  end

  def update
    (start_date..(Time.zone.today-1)).each_with_index do |current_date, index|
      DynamicInfo.create(country: country, date: current_date.to_s, rank: dynamic_info[:ranks][index],
                         power: dynamic_info[:power][index],
                         downloads: dynamic_info[:downloads][index],
                         shop_type: shop_type, device: device,
                         app_id: current_app.id)
    end
  end
end
