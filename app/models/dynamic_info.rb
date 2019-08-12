# == Schema Information
#
# Table name: dynamic_infos
#
#  id             :bigint           not null, primary key
#  country        :string
#  date           :date
#  rank           :integer
#  power          :float
#  downloads      :integer
#  shop_type      :string
#  device         :string
#  application_id :bigint
#

class DynamicInfo < ApplicationRecord
  belongs_to :application
end
