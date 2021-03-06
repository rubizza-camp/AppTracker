# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  confirmation_token :string
#

class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :apps, through: :subscriptions
end
