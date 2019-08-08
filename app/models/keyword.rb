class Keyword < ApplicationRecord
  attribute :keywords
  attribute :rank
  attribute :shop_type
  attribute :app_id
  belongs_to :applicationInfo
end
