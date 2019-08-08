# == Schema Information
#
# Table name: similar_apps
#
#  id             :bigint           not null, primary key
#  apple_app_id   :integer
#  android_app_id :string
#  app_id         :integer
#

class SimilarApp < ApplicationRecord
  belongs_to :application
end
