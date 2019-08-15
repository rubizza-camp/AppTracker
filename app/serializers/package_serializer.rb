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

class PackageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :average_rating, :google_play_link, :icon_link
end
