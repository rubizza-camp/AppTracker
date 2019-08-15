class AppDynamicUpdater
  def self.update(name)
    new.update(name)
  end

  def update(name)
    update_one(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    update_all_apps
  end

  private

  def update_one(name)
    dynamic_info = AppDynamicLoader(App.where(title: name).ids) if App.where(title: name).ids
  end

  def update_all_apps
    Application.all.each do |app|
      TargetCountry.pluck(:country_name).each do |country|
      dynamic_info = AppDynamicLoader(app_id, country, )
      DynamicInfo.create(country: country, date: , rank: dynamic_info, power: ,
                         downloads: , shop_type: , device: , app_id: )
      end
    end
  end
end
