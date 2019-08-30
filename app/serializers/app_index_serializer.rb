class AppIndexSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :apple_url, :android_url, :icon_url, :rating
end
