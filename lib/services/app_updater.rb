class AppUpdater
  def self.update(name)
    new.update(name)
  end

  def update(name)
    update_one_app(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    update_all_apps
  end

  private

  def update_one_app(name)
    AppMetaUpdater.update_meta(name)
    AppDynamicUpdater.update(name)   
    AppRatingsUpdater.update(name)
    Services::ApiDateManager.update(App.find_by(title: name).id)
  end

  def update_all_apps
    AppDynamicUpdater.update_all
    AppRatingsUpdater.update_all
    Services::ApiDateManager.update_all
  end
end
