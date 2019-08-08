# == Schema Information
#
# Table name: dinamic_infos
#
#  id        :bigint           not null, primary key
#  country   :string
#  date      :date
#  rank      :integer
#  power     :float
#  downloads :integer
#  shop_type :string
#  device    :string
#  app_id    :integer
#

class DinamicInfo < ApplicationRecord
  belongs_to :application
end
