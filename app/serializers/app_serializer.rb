class AppSerializer
  include FastJsonapi::ObjectSerializer
  attributes :apple_app_id, :android_app_id, :title,
             :apple_url, :android_url, :short_description,
             :long_description, :icon_url, :content_rating,
             :price, :dev_name, :dev_email, :dev_website
end
