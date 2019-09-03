# == Schema Information
#
# Table name: apps
#
#  id                :bigint           not null, primary key
#  apple_app_id      :integer
#  android_app_id    :string
#  title             :string
#  apple_url         :string
#  android_url       :string
#  short_description :string
#  long_description  :string
#  icon_url          :string
#  content_rating    :string
#  price             :string
#  dev_name          :string
#  dev_email         :string
#  dev_website       :string
#  rating            :float
#

class AppSerializer < BaseSerializer
  attributes :apple_app_id, :android_app_id, :title,
             :apple_url, :android_url, :short_description,
             :long_description, :icon_url, :content_rating,
             :price, :dev_name, :dev_email, :dev_website, :rating

  has_many :ratings
  has_many :dynamic_infos
end
