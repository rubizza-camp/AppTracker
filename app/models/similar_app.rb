# == Schema Information
#
# Table name: similar_apps
#
#  id             :bigint           not null, primary key
#  similar_app_id :integer
#  app_id         :bigint
#

class SimilarApp < ApplicationRecord
  belongs_to :app
end
