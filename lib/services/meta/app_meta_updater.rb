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
    ids = AppIdLoader.app_id(name)
    insert_data(AppMetaParser.parse_meta(ids, AppMetaLoader.meta(ids)))
  end

  def insert_data(data)
    return data[:title].downcase if App.find_by(title: data[:title].downcase)

    App.create(apple_app_id: data[:apple_app_id], android_app_id: data[:android_app_id],
               title: data[:title].downcase, short_description: data[:s_desc],
               long_description: data[:l_desc], icon_url: data[:icon_url],
               content_rating: data[:content_rating], price: data[:price],
               dev_name: data[:dev_name], dev_email: data[:dev_email], dev_website: data[:dev_website],
               android_url: data[:android_url], apple_url: data[:apple_url])
    data[:title].downcase
  end
end
