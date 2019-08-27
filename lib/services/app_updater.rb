  private

  def update_one(name)
    title = AppMetaUpdater.update_meta(name)
    AppDynamicUpdater.update(title)
    AppRatingsUpdater.update(title)
    Services::ApiDateManager.update(App.find_by(title: title).id)
  end

  def update_all
    App.find_each do |cur_app|
      AppDynamicUpdater.update
      AppRatingsUpdater.update
      Services::ApiDateManager.update
    end
  end
end
