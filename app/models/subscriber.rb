class Subscriber < ApplicationRecord
  has_many :subscriptions
  has_many :apps, through: :subscriptions
end
