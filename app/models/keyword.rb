# == Schema Information
#
# Table name: keywords
#
#  id        :bigint           not null, primary key
#  keyword   :string
#  shop_type :string
#

class Keyword < ApplicationRecord
  has_many :app_keywords, dependent: :destroy
  has_many :applications,
           through: :app_keywords
end
