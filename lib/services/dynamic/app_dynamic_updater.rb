class AppDynamicUpdater
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
    return if start_date > (Date.today-1)
    downloads_android = AppDownloadsLoader.call('android', cur_app.android_app_id, start_date)
    downloads_apple = AppDownloadsLoader.call('ios', cur_app.apple_app_id, start_date, '&device=iphone')
    TargetCountry.pluck(:country_name).each do |country|
      parsed_downloads_android = AppDownloadsParser.call(downloads_android, country) 
      parsed_downloads_apple = AppDownloadsParser.call(downloads_apple, country)
      dynamic_info_android = (AppDynamicLoader.call('android', cur_app.android_app_id, start_date, country)).merge(parsed_downloads_android)
      dynamic_info_apple = (AppDynamicLoader.call('ios', cur_app.apple_app_id, start_date, country, '&device=iphone')).merge(parsed_downloads_apple)
      update_dynamic(dynamic_info_android, cur_app, country, start_date, 'android')
      update_dynamic(dynamic_info_apple, cur_app, country, start_date, 'ios', 'iphone')
    end
  end

  def update_dynamic(dynamic_info, cur_app, country, start_date, shop_type, device = '')
    (start_date..(Date.today-1)).each_with_index do |cur_date, index|
      DynamicInfo.create(country: country, date: cur_date.to_s, rank: dynamic_info[:ranks][index],
                         power: dynamic_info[:power][index], downloads: dynamic_info[:downloads][index],
                         shop_type: shop_type, device: device, app_id: cur_app.id)
    end
  end
end
