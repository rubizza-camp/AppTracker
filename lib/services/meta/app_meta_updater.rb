class AppMetaUpdater
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def update_meta
    data_load
  end

  def self.update_meta(name)
    new(name).update_meta
  end

  private

  def data_load
    return if App.find_by(title: name)
      ids = AppIdLoader.app_id(name)
      insert_data(parsed = AppMetaParser.parse_meta(ids, AppMetaLoader.meta(ids)))
      insert_similar_apps(parsed.parsed_response) 
  end

  def insert_data(data)
    App.create(apple_app_id: data[:apple_app_id], android_app_id: data[:android_app_id],
               title: data[:title].downcase, short_description: data[:s_desc],
               long_description: data[:l_desc], icon_url: data[:icon_url],
               content_rating: data[:content_rating], price: data[:price],
               dev_name: data[:dev_name], dev_email: data[:dev_email], dev_website: data[:dev_website],
               android_url: data[:android_url], apple_url: data[:apple_url])
  end

  def insert_similar_apps(parsed)
    app = App.find_by(title: parsed['content']['title'].downcase)
    parsed['content']['similar_apps'].each do |similar_app|
      if (sim_app = App.find_by(title: similar_app['title'].downcase))
        SimilarApp.create(similar_app_id: sim_app.id, app_id: app.id)
        SimilarApp.create(similar_app_id: app.id, app_id: sim_app.id)
      end
    end
  end
end
