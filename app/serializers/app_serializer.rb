class AppSerializer < BaseSerializer
  attributes :apple_app_id, :android_app_id, :title,
             :apple_url, :android_url, :short_description,
             :long_description, :icon_url, :content_rating,
             :price, :dev_name, :dev_email, :dev_website

  has_many :ratings
  has_many :dynamic_infos
end
