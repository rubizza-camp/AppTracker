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
  before_create :set_confirmation_token

  has_many :subscriptions, dependent: :destroy
  has_many :apps, through: :subscriptions

  private

  def set_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s if confirmation_token.blank?
  end
end
