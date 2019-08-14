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
  attributes :name, :company_name, :review_count, :average_rating, :downloads_count, :icon_link
end
