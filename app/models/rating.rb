class Rating < ApplicationRecord
  attribute :rating_1
  attribute :rating_2
  attribute :rating_3
  attribute :rating_4
  attribute :rating_5
  attribute :total_rating
  attribute :average_rating
  attribute :shop_type
  attribute :date
  attribute :app_id
  belongs_to :applicationInfo
end
