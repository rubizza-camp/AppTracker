class AppUpdater < AppMothership
  def self.update(name)
    new.update_one(name)
  end

  def update_one(name)
    update_one_app(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    new.update_all_apps
  end

  private

  def update_one_app(name)
    AppDynamicUpdater.update(name)
    AppRatingsUpdater.update(name)
    Services::ApiDateManager.update(App.where(title: name).first.id)
  end

  def update_all_apps
    AppDynamicUpdater.update_all
    AppRatingsUpdater.update_all
    Services::ApiDateManager.update_all
  end
end
