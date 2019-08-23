# == Schema Information
#
# Table name: api_tokens
#
#  id      :bigint           not null, primary key
#  value   :string
#  credits :integer          default(100)
#

class ApiToken < ApplicationRecord
  def use(minimal_credits)
    available_token = ApiToken.where("credits >= #{minimal_credits}").order(:credits).first
    return unless available_token

    available_token.update(credits: (available_token.credits - minimal_credits))
    available_token.value
  end
end
