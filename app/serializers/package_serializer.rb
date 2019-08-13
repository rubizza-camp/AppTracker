class PackageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :average_rating, :google_play_link, :icon_link
end
