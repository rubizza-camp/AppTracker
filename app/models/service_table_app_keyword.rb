# == Schema Information
#
# Table name: service_table_app_keywords
#
#  id         :bigint           not null, primary key
#  app_id     :integer
#  keyword_id :integer
#

class ServiceTableAppKeyword < ApplicationRecord
  belongs_to :application
  belongs_to :keyword
end
