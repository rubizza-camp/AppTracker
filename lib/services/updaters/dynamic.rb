class Services::Updaters::Dynamic < Services::Base
  attribute :downloads
  attribute :power
  attribute :ranks
  attribute :current_app
  attribute :country
  attribute :start_date
  attribute :dynamic_info

  private

  def take_app_by_name(name)
    @current_app = App.find_by(title: name)
    @start_date = Services::ApiDateManager.last_date(current_app.id)
    return if start_date > Time.zone.today - 1
    load_dynamic
  end

  def take_all_apps
    App.find_each do |cur_app|
      @current_app = cur_app
      @start_date = Services::ApiDateManager.last_date(current_app.id)
      return if start_date > Time.zone.today - 1
      load_dynamic
    end
  end

  def load_downloads
    @downloads = { android:
                   Services::ApptweakApi::Downloads.call(id: current_app.android_app_id, start_date: start_date,
                                                         shop_type: 'android'), 
                   ios:
                   Services::ApptweakApi::Downloads.call(id: current_app.apple_app_id, start_date: start_date,
                                                         shop_type: 'ios', device: 'iphone') }
  end

  def load_power
    @power = {     android:
                   Services::ApptweakApi::Power.call(id: current_app.android_app_id, start_date: start_date,
                                                     shop_type: 'android'), 
                   ios:
                   Services::ApptweakApi::Power.call(id: current_app.apple_app_id, start_date: start_date,
                                                     shop_type: 'ios', device: 'iphone') }
  end

  def load_rankings
    @rankings = {  android:
                   Services::ApptweakApi::Rankings.call(id: current_app.android_app_id, start_date: start_date,
                                                        shop_type: 'android')
                   ios:
                   Services::ApptweakApi::Rankings.call(id: current_app.apple_app_id, start_date: start_date,
                                                        shop_type: 'ios', device: 'iphone') }
  end

  def load_dynamic
    load_power
    load_rankings
    load_downloads
    parse_dynamic
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
  end

  def update_app(shop_type)
    (dynamic_info[:ranks][shop_type][:start_date]..(dynamic_info[:ranks][shop_type][:end_date])).each_with_index do |current_date, index|
      DynamicInfo.create(country: country, date: current_date.to_s, rank: dynamic_info[:ranks][shop_type][index],
                         power: dynamic_info[:power][shop_type][index],
                         downloads: dynamic_info[:downloads][shop_type][index],
                         shop_type: shop_type, device: dynamic_info[:power][shop_type][:device],
                         app_id: current_app.id)
    end
  end
end
