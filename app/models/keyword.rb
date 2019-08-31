# == Schema Information
#
# Table name: keywords
#
#  id    :bigint           not null, primary key
#  value :string
#

class Keyword < ApplicationRecord
  has_many :apps_keywords, dependent: :destroy
  has_many :apps,
           through: :apps_keywords
end
