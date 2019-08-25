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
#

class App < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :dynamic_infos, dependent: :destroy
  has_many :apps_keywords, dependent: :destroy
  has_many :keywords, through: :apps_keywords
  has_many :similar_apps, dependent: :destroy
  has_many :subs, dependent: :destroy
  has_many :users, through: :subs
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions

  def self.subscribed(email)
    Subscriber.find_by!(email: email).apps
  end

  def subs_list
    subscribers.map(&:email).join(', ')
  end

  def subs_list=(email)
    self.subscribers = emails.split(',').map do |el|
      Subscriber.where(email: el.strip).first_or_create!
    end
  end
end
