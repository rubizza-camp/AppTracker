class ApplicationInfo < ApplicationRecord
  attribute :apple_app_id
  attribute :android_app_id
  attribute :title
  attribute :url
  attribute :short_description
  attribute :long_description
  attribute :icon_url
  attribute :content_rating
  attribute :price
  attribute :dev_name
  attribute :dev_email
  attribute :dev_website
  has_many :ratings, :dinamic_infos, :keywords,
  :similar_apps,  dependent: :destroy
end
