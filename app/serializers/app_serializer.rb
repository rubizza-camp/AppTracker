class AppSerializer
  include FastJsonapi::ObjectSerializer
    has_many :dynamic_infos
    has_many :ratings

    attributes :apple_app_id, :android_app_id, :title,
               :apple_url, :android_url, :short_description,
               :long_description, :icon_url, :content_rating,
               :price, :dev_name, :dev_email, :dev_website

    attribute :search_data do |app|
      { title: :"#{app.title}", apple: :"#{app.apple_url}", android: :"#{app.android_url}", icon: :"#{app.icon_url}" }
  end
end
