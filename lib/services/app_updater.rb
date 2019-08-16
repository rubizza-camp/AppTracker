class AppUpdater
  def self.update(name)
    new.update_one_app(name)
  end

  def self.update_all
    new.update_all_apps
  end

  private

  def update_one_app(name)
    # AppMetaUpdater.update_meta(name)
    AppDynamicUpdater.update(name)
    AppRatingsUpdater.update(name)
    Services::ApiDateManager.update(App.where(title: name).first.id)
  end

  def update_all_apps
    AppRatingsUpdater.update_all
    AppDynamicUpdater.update_all
    Services::ApiDateManager.update_all
  end
end
