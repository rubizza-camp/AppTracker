class AppMetaUpdater
  def update_meta(meta)
    insert_meta_into_db(meta)
  end

  def self.update_meta(meta)
    new.update_meta(meta)
  end

  private

  def insert_meta_into_db(meta) # rubocop:disable Metrics/AbcSize
    Create.Application(apple_app_id: meta[:apple_app_id], android_app_id: meta[:android_app_id],
                       title: meta[:title], url: meta[:url], short_description: meta[:s_desc],
                       long_description: meta[:l_desc], icon_url: meta[:icon_url],
                       content_rating: meta[:content_rating], price: meta[:price],
                       dev_name: meta[:dev_name], dev_email: meta[:dev_email], dev_website: meta[dev_website],
                       android_url: meta[:android_url], apple_url: meta[:apple_url])
  end
end
