class Services::Updaters::Dynamic < Services::Base
  attr_reader :downloads, :power, :ranks
  attribute :current_app
  attribute :country
  attribute :start_date
  attribute :dynamic_info
  attribute :shop_type
  attribute :id

  private

  def perform
    load_by_android
    load_by_ios
  end

  def load_by_android
    @shop_type = 'android'
    @device = nil
    @id = current_app.android_app_id
    date
    return if @start_date > Time.zone.today - 1
    update_app
  end

  def load_by_ios
    @shop_type = 'ios'
    @device = 'iphone'
    @id = current_app.apple_app_id
    date
    return if @start_date > Time.zone.today - 1
    update_app
  end

  def date
    dynamic = current_app.DynamicInfo.find_by(shop_type: shop_type)
    if dynamic
      @start_date = dynamic.order(date: :desc).first
    else
      @start_date = Time.zone.today - 1.month
    end 
  end

  def update_app
    load_downloads
    load_power
    load_rankings
    parse_dynamic
  end

  def load_downloads
    @downloads = { "#{shop_type}":
                   Services::ApptweakApi::Downloads.call(id: id, start_date: start_date,
                                                         shop_type: shop_type, device: device)                                      shop_type: 'ios', device: 'iphone') }
  end

  def load_power
    @power = { "#{shop_type}":
                   Services::ApptweakApi::Power.call(id: id, start_date: start_date,
                                                     shop_type: shop_type, device: device)
  end

  def load_rankings
    @rankings = {  "#{shop_type}":
                   Services::ApptweakApi::Rankings.call(id: id, start_date: start_date,
                                                        shop_type: shop_type, device: device)
  end

  def parse_dynamic
    TargetCountry.pluck(:country_name).each do |country|
      @country = country
      parse_downloads
      parse_power
      parse_ranks
      update_app(:andriod)
      update_app(:ios)
    end
  end

  def parse_downloads
    @dynamic_info[:downloads] = {
      andriod:
      Services::Parsers::Downloads.call(response: downloads[:andriod], shop_type: 'android', country: country),
      ios:
      Services::Parsers::Downloads.call(response: downloads[:ios], shop_type: 'ios', country: country) }
  end

  def parse_power
    @dynamic_info[:power] = {
      android:
      Services::Parsers::Power.call(response: power[:andriod], shop_type: 'android', country: country),
      ios:
      Services::Parsers::Power.call(response: power[:ios], shop_type: 'ios', country: country) }
  end

  def parse_ranks
    @dynamic_info[:ranks] = {
      android:
      Services::Parsers::Ranks.call(response: ranks[:andriod], shop_type: 'android', country: country),
      ios:
      Services::Parsers::Ranks.call(response: ranks[:ios], shop_type: 'ios', country: country) }
      update
  end

  def update
    (dynamic_info[:ranks][shop_type][:start_date]..(dynamic_info[:ranks][shop_type][:end_date])).each_with_index do |current_date, index|
      DynamicInfo.create(country: country, date: current_date.to_s, rank: dynamic_info[:ranks][shop_type][index],
                         power: dynamic_info[:power][shop_type][index],
                         downloads: dynamic_info[:downloads][shop_type][index],
                         shop_type: shop_type, device: dynamic_info[:power][shop_type][:device],
                         app_id: current_app.id)
    end
  end
end
