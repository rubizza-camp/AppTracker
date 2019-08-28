# == Schema Information
#
# Table name: ratings
#
#  id             :bigint           not null, primary key
#  rating_1       :integer
#  rating_2       :integer
#  rating_3       :integer
#  rating_4       :integer
#  rating_5       :integer
#  total_rating   :integer
#  average_rating :float
#  shop_type      :string
#  date           :date
#  app_id         :bigint
#

class Rating < ApplicationRecord
  belongs_to :app
end
