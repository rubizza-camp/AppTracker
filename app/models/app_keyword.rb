# == Schema Information
#
# Table name: app_keywords
#
#  id             :bigint           not null, primary key
#  priotity       :integer
#  application_id :bigint
#  keyword_id     :bigint
#

class AppKeyword < ApplicationRecord
  belongs_to :application
  belongs_to :keyword
end
