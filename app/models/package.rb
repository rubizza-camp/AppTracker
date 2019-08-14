# == Schema Information
#
# Table name: packages
#
#  id               :bigint           not null, primary key
#  name             :string
#  average_rating   :float
#  google_play_link :string
#  icon_link        :string
#

class Package < ApplicationRecord
end
