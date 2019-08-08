# == Schema Information
#
# Table name: keywords
#
#  id        :bigint           not null, primary key
#  keywords  :string
#  rank      :integer
#  shop_type :string
#  app_id    :integer
#

class Keyword < ApplicationRecord
  belongs_to :application
  has_many :service_table_app_keywords, dependent: :destroy
  has_many :applications,
           through: :service_table_app_keywords, dependent: :destroy
end
