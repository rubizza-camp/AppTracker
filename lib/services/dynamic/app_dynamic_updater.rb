class AppDynamicUpdater
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
    require 'pry'; binding.pry
    app_id = App.find_by_title(name).android_app_id
    TargetCountry.pluck(:country_name).each do |country|
      if App.find_by_title(name)
        dynamic_info = AppDynamicLoader.dynamic_load_by_android(app_id, country,
                                                                Services::ApiDateManager.last_date(App.find_by_title(name).id))
      end
      start_date = dynamic_info[:date_period][:start_date]
      end_date =  dynamic_info[:date_period][:end_date]
      i = 0
      begin
        DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[:ranks][i], power: dynamic_info[:power][i],
                           downloads: dynamic_info[:downloads][i], shop_type: 'android', app_id: App.find_by_title(name).id)
        start_date = start_date + 1
        i = i + 1
      end while start_date != end_date
    end
  end

  def update_one_by_apple(name)
    app_id = App.find_by_title(name).apple_app_id
    TargetCountry.pluck(:country_name).each do |country|
      if App.find_by_title(name)
        dynamic_info = AppDynamicLoader.dynamic_load_by_apple(app_id, country,
                                                              Services::ApiDateManager.last_date(App.find_by_title(name).id))
      end
      start_date = dynamic_info[:date_period][:start_date]
      end_date =  dynamic_info[:date_period][:end_date]
      i = 0
      begin
      DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[:ranks][i], power: dynamic_info[:power][i],
                         downloads: dynamic_info[:downloads][i], shop_type: 'apple', device: 'iPhone', app_id: App.find_by_title(name).id)
        start_date = start_date + 1
        i = i + 1
      end while start_date != end_date
    end
  end

  def update_all_apps_by_apple
    App.all.each do |app|
      TargetCountry.pluck(:country_name).each do |country|
        dynamic_info = AppDynamicLoader.dynamic_load_by_apple(app.apple_app_id, country,
                                                              Services::ApiDateManager.last_date(App.find_by_title(name).id))
        start_date = dynamic_info[:date_period][:start_date]
        end_date =  dynamic_info[:date_period][:end_date]
        i = 0
        begin  
          DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[ranks][i], power: dynamic_info[:power][i],
                             downloads: dynamic_info[:downloads][i], shop_type: 'apple', device: 'iPhone', app_id: App.find_by_title(name).id)
          start_date = start_date + 1
          i = i + 1
        end while start_date != end_date
      end
    end
  end

  def update_all_apps_by_android
    App.all.each do |app|
      TargetCountry.pluck(:country_name).each do |country|
        dynamic_info = AppDynamicLoader.dynamic_load_by_android(app.android_app_id, country,
                                                                Services::ApiDateManager.last_date(App.find_by_title(name).id))
        start_date = dynamic_info[:date_period][:start_date]
        end_date =  dynamic_info[:date_period][:end_date]
        i = 0
        begin
          DynamicInfo.create(country: country, date: start_date.to_s, rank: dynamic_info[:ranks][i], power: dynamic_info[:power][i],
                             downloads: dynamic_info[:downloads][i], shop_type: 'android', app_id: App.find_by_title(name).id)
          start_date = start_date + 1
          i = i + 1
        end while start_date != end_date
      end
    end
  end
end
