class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :apps, through: :subscriptions
end
