class AppDynamicUpdater
  def self.update(name)
    new.update(name)
  end

  def update(name)
    response_load(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    response_load_all
  end

  private

  def response_load(name)
    cur_app = App.find_by(title: name)
    update_call(cur_app) if cur_app
  end

  def response_load_all
    App.find_each do |cur_app|
      update_call(cur_app)
    end
  end

  def update_call(cur_app)
    TargetCountry.pluck(:country_name).each do |country|
      dynamic_info = AppDynamicLoader.dynamic_load(cur_app, country, Services::ApiDateManager.last_date(cur_app.id))
      update_dynamic(dynamic_info[:by_android], cur_app, country)
      update_dynamic(dynamic_info[:by_apple], cur_app, country)
    end
  end

  def update_dynamic(dynamic_info, cur_app, country)
    date_period = response[:date_period]
    (date_period[:start_date]..date_period[:end_date]).each_with_index do |cur_date, index|
      DynamicInfo.create(country: country, date: cur_date.to_s, rank: dynamic_info[:ranks][index],
                         power: dynamic_info[:power][index], downloads: dynamic_info[:downloads][index],
                         shop_type: dynamic_info[:shop_type], device: dynamic_info[:device] app_id: cur_app.id)
    end
  end
end
