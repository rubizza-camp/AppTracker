# == Schema Information
#
# Table name: applications
#
#  id                :bigint           not null, primary key
#  apple_app_id      :integer
#  android_app_id    :string
#  title             :string
#  apple_url         :string
#  andriod_url       :string
#  short_description :string
#  long_description  :string
#  icon_url          :string
#  content_rating    :string
#  price             :string
#  dev_name          :string
#  dev_email         :string
#  dev_website       :string
#

class Application < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :dinamic_infos, dependent: :destroy
  has_many :keywords, dependent: :destroy
  has_many :similar_apps, dependent: :destroy
end
