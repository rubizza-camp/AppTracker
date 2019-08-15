class AppDynamicUpdater < AppMothership
  def self.update(name)
    new.update(name)
  end

  def update(name)
    update_one_by_android(name)
    update_one_by_apple(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    update_all_apps_by_apple
    update_all_apps_by_android
  end

  private

  def update_one_by_android(name)
    app_id = App.where(title: name).first.android_app_id
    TargetCountry.pluck(:country_name).each do |country|
      if App.where(title: name)
        dynamic_info = AppDynamicLoader.dynamic_load_by_android(app_id, country,
                                                                Services::ApiDateManager.last_date(app_id))
      end
      start_date = dynamic_info[:date_period][:start_date]
      end_date =  dynamic_info[:date_period][:end_date]
      begin
        DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[:ranks], power: dynamic_info[:power],
                           downloads: dynamic_info[:downloads], shop_type: 'android', app_id: app_id)
        start_date = start_date + 1
      end while start_date != end_date
    end
  end

  def update_one_by_apple(name)
    app_id = App.where(title: name).first.apple_app_id
    TargetCountry.pluck(:country_name).each do |country|
      if App.where(title: name)
        dynamic_info = AppDynamicLoader.dynamic_load_by_apple(app_id, country,
                                                              Services::ApiDateManager.last_date(app_id))
      end
      start_date = dynamic_info[:date_period][:start_date]
      end_date =  dynamic_info[:date_period][:end_date]
      begin
      DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[:ranks], power: dynamic_info[:power],
                         downloads: dynamic_info[:downloads], shop_type: 'apple', device: 'iPhone', app_id: app_id)
        start_date = start_date + 1
      end while start_date != end_date
    end
  end

  def update_all_apps_by_apple
    Application.all.each do |app|
      TargetCountry.pluck(:country_name).each do |country|
        dynamic_info = AppDynamicLoader.dynamic_load_by_apple(app.apple_app_id, country,
                                                              Services::ApiDateManager.last_date(app.id))
        start_date = dynamic_info[:date_period][:start_date]
        end_date =  dynamic_info[:date_period][:end_date]
        begin  
          DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[ranks], power: dynamic_info[:power],
                             downloads: dynamic_info[:downloads], shop_type: 'apple', device: 'iPhone', app_id: app.id)
          start_date = start_date + 1
        end while start_date != end_date
      end
    end
  end

  def update_all_apps_by_android
    Application.all.each do |app|
      TargetCountry.pluck(:country_name).each do |country|
        dynamic_info = AppDynamicLoader.dynamic_load_by_android(app.android_app_id, country,
                                                                Services::ApiDateManager.last_date(app.id))
        start_date = dynamic_info[:date_period][:start_date]
        end_date =  dynamic_info[:date_period][:end_date]
        begin
          DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[:ranks], power: dynamic_info[:power],
                             downloads: dynamic_info[:downloads], shop_type: 'android', app_id: app.id)
          start_date = start_date + 1
        end while start_date != end_date
      end
    end
  end
end
