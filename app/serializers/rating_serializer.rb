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

class RatingSerializer < BaseSerializer
  attributes :rating_1, :rating_2, :rating_3,
             :rating_4, :rating_5, :total_rating,
             :average_rating, :shop_type, :date, :app_id

  belongs_to :app
end
