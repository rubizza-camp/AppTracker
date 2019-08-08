# == Schema Information
#
# Table name: keywords
#
#  id        :bigint           not null, primary key
#  keywords  :string
#  rank      :integer
#  shop_type :string
#  app_id    :integer
#

class Keyword < ApplicationRecord
  belongs_to :application
end
