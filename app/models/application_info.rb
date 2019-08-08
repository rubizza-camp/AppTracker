class ApplicationInfo < ApplicationRecord
  has_many :ratings, :dinamic_infos, :keywords,
           :similar_apps, dependent: :destroy
end
