# == Schema Information
#
# Table name: apps_keywords
#
#  id         :bigint           not null, primary key
#  priotity   :integer
#  app_id     :bigint
#  keyword_id :bigint
#

class AppsKeywords < ApplicationRecord
  belongs_to :app
  belongs_to :keyword
end
