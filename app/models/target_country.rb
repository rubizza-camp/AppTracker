# == Schema Information
#
# Table name: target_countries
#
#  id           :bigint           not null, primary key
#  country_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TargetCountry < ApplicationRecord
end
