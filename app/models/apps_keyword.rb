# == Schema Information
#
# Table name: apps_keywords
#
#  id         :bigint           not null, primary key
#  app_id     :bigint
#  keyword_id :bigint
#

class AppsKeyword < ApplicationRecord
  belongs_to :app
  belongs_to :keyword
end
