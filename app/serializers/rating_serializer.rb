class RatingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :rating_1, :rating_2, :rating_3,
             :rating_4, :rating_5, :total_rating,
             :average_rating, :shop_type, :date, :app_id
end
