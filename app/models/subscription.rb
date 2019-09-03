# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint           not null, primary key
#  app_id     :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :app
end
