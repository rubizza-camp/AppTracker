class Services::Updaters::Metadata < Services::Base
  attribute :ids
  attribute :data

  private

  def data_load
    android_id = Services::ApptweakApi::Searches.call(term: name, shop_type: 'android')
    apple_id = Services::ApptweakApi::Searches.call(term: name, shop_type: 'ios')
    @ids = { android_app_id: android_id, apple_app_id: apple_id }
    @data = Services::Parsers::Metadata.call(Services::ApptweakApi::Metadata)
    insert_data
  end

  def insert_data
    return data[:title].downcase if App.find_by(title: data[:title].downcase)

    App.create(apple_app_id: ids[:apple_app_id], android_app_id: ids[:android_app_id],
               title: data[:title].downcase, short_description: data[:s_desc],
               long_description: data[:l_desc], icon_url: data[:icon_url],
               content_rating: data[:content_rating], price: data[:price],
               dev_name: data[:dev_name], dev_email: data[:dev_email], dev_website: data[:dev_website],
               android_url: data[:android_url], apple_url: data[:apple_url])
    data[:title].downcase
  end
end
