class AppSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :apple_app_id, :android_app_id, :title,
             :apple_url, :android_url, :short_description,
             :long_description, :icon_url, :content_rating,
             :price, :dev_name, :dev_email, :dev_website
  attributes :search_info do
    "#{object.title} #{object.apple_url} #{object.android_url} #{object.icon_url}"
  end
  has_many :ratings
  has_many :dinamic_infos
end
