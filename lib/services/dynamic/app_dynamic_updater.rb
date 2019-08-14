class AppDynamicUpdater
  def self.update(*name)
    new.update(name)
  end

  def update(*name)
    if name
      update_one(name)
    else
      update_all
    end
  end

  private

  def update_one
    app_ids = AppIdLoader.app_id(name)
    AppDynamicLoader(app_ids)
  end

  def update_all
    ids_load.size.times do |i|
      # Load ALL info
    end
  end

  def ids_load
    ids = Array.new
    Application.all.each do |app|
      ids['HERE MUST BE ID'] = {apple_app_id: app[:apple_app_id],
                android_app_id: app[:android_app_id]}
    end
    ids
  end
end
