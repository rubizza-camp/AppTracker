# == Schema Information
#
# Table name: api_tokens
#
#  id      :bigint           not null, primary key
#  value   :string
#  credits :integer          default(100)
#

class ApiToken < ApplicationRecord
end
