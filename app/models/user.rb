# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  before_create :set_confirmation_token

  has_many :subscriptions, dependent: :destroy
  has_many :apps, through: :subscriptions

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  private

  def set_confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end
end
