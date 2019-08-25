class Subscription < ApplicationRecord
  belongs_to :app
  belongs_to :subscriber
end
