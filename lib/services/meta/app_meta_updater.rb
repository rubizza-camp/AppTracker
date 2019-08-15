class AppMetaUpdater
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def update_meta
    insert_meta_into_db
  end

  def self.update_meta(name)
    new(name).update_meta
  end

  private

  def insert_meta_into_db # rubocop:disable Metrics/AbcSize
    ids = AppIdLoader.app_id(name)
    meta = AppMetaParser.parse_meta(ids, AppMetaLoader.meta(ids))
    App.create(apple_app_id: meta[:apple_app_id], android_app_id: meta[:android_app_id],
               title: meta[:title].downcase, short_description: meta[:s_desc],
               long_description: meta[:l_desc], icon_url: meta[:icon_url],
               content_rating: meta[:content_rating], price: meta[:price],
               dev_name: meta[:dev_name], dev_email: meta[:dev_email], dev_website: meta[:dev_website],
               android_url: meta[:android_url], apple_url: meta[:apple_url])
  end
end
