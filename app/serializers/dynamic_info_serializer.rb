# == Schema Information
#
# Table name: dynamic_infos
#
#  id        :bigint           not null, primary key
#  country   :string
#  date      :date
#  rank      :integer
#  power     :float
#  downloads :integer
#  shop_type :string
#  device    :string
#  app_id    :bigint
#

class DynamicInfoSerializer < BaseSerializer
  attributes :country, :date, :rank, :power,
             :downloads, :shop_type, :device, :app_id

  belongs_to :app
end
