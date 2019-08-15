class AppSerializer
  include FastJsonapi::ObjectSerializer
  attributes :search_info do
    "#{object.title} #{object.apple_url} #{object.android_url} #{object.icon_url}"
  end
  has_many :ratings
  has_many :dinamic_infos
end
