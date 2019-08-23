class Services::Updaters::Dynamic < Services::Updaters::Base
  attr_reader :downloads_android, :downloads_apple, :dynamic_info_android, :dynamic_info_apple
  def self.update(name)
    new.update(name)
  end

  def update(name)
    load_app_by_name(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    load_all_app
  end

  private

  def load_app_by_name(name)
    cur_app = App.find_by(title: name)
    update_call(cur_app) if cur_app
  end

  def load_all_app
    App.find_each do |cur_app|
      update_call(cur_app)
    end
  end

  def update_call(cur_app)
    return if cur_app.nil?

    start_date = Services::ApiDateManager.last_date(cur_app.id)
    return if start_date > (Time.zone.today - 1)

    @downloads_android = AppDownloadsLoader.call('android', cur_app.android_app_id, start_date)
    @downloads_apple = AppDownloadsLoader.call('ios', cur_app.apple_app_id, start_date, '&device=iphone')
    TargetCountry.pluck(:country_name).each do |country|
      dynamic_response(country)
    end
  end

  def dynamic_response(country)
    parsed_downloads_android = AppDownloadsParser.call(downloads_android, country)
    parsed_downloads_apple = AppDownloadsParser.call(downloads_apple, country)
    @dynamic_info_android = AppDynamicLoader.call('android', cur_app.android_app_id, start_date,
                                                  country).merge(parsed_downloads_android)
    @dynamic_info_apple = AppDynamicLoader.call('ios', cur_app.apple_app_id, start_date, country,
                                                '&device=iphone').merge(parsed_downloads_apple)
  end

  def call_update_dynamic
    update_dynamic(dynamic_info_android, { cur_app: cur_app, country: country, start_date: start_date }, 'android')
    update_dynamic(dynamic_info_apple, { cur_app: cur_app, country: country, start_date: start_date },
                   'ios', 'iphone')
  end

  def update_dynamic(dynamic_info, params, shop_type, device = '')
    (params[:start_date]..(Time.zone.today - 1)).each_with_index do |cur_date, index|
      DynamicInfo.create(country: params[:country], date: cur_date.to_s, rank: dynamic_info[:ranks][index],
                         power: dynamic_info[:power][index], downloads: dynamic_info[:downloads][index],
                         shop_type: shop_type, device: device, app_id: params[:cur_app].id)
    end
  end
end
