class RatingSerializer < BaseSerializer
  attributes :rating_1, :rating_2, :rating_3,
             :rating_4, :rating_5, :total_rating,
             :average_rating, :shop_type, :date, :app_id

  belongs_to :app
end
